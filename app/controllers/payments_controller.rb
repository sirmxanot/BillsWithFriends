class PaymentsController < ApplicationController
  before_filter :authenticate_user!
  
  # GET /payments
  # GET /payments.json
  def index
    @payments = Payment.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @payments }
    end
  end

  # GET /payments/1
  # GET /payments/1.json
  def show
    @payment = Payment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @payment }
    end
  end

  # GET /payments/new
  # GET /payments/new.json
  def new
    @payment = Payment.new
    @previous_payments = current_user.payments
    @users = User.all
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @payment }
    end
  end

  # GET /payments/1/edit
  def edit
    @payment = Payment.find(params[:id])
    @users = User.all

    if @payment.user_id != current_user.id
      flash[:error] = "You can't edit a payment that you didn't create."
      redirect_to @payment
    end 
  end

  # POST /payments
  # POST /payments.json
  def create
    @payment = Payment.new(params[:payment])
    @previous_payments = current_user.payments
    @users = User.all

    respond_to do |format|
      if @payment.save
        format.html { redirect_to @payment, notice: 'Payment was successfully created.' }
        format.json { render json: @payment, status: :created, location: @payment }
      else
        format.html { render action: "new" }
        format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /payments/1
  # PUT /payments/1.json
  def update
    @payment = Payment.find(params[:id])

    if @payment.user_id == current_user.id
      if @payment.update_attributes(params[:payment])
        flash[:success] = 'Payment was successfully updated.'
      else
        render action: "edit"
      end
    else
      flash[:error] = "You can't update a payment that you didn't create."
    end

    redirect_to @payment
  end

  # DELETE /payments/1
  # DELETE /payments/1.json
  def destroy
    @payment = Payment.find(params[:id])
    
    if @payment.user_id == current_user.id
      @payment.destroy
      flash[:success] = "You have successfully deleted the payment."
    else
      flash[:error] = "You can't delete payments that you didn't create."
    end

    redirect_to payments_url
  end
end
