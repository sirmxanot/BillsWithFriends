class RegistersController < ApplicationController
  before_filter :authenticate_user!
  
  # GET /registers
  # GET /registers.json
  def index
    @registers = Register.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @registers }
    end
  end

  # GET /registers/1
  # GET /registers/1.json
  def show
    @register = Register.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @register }
    end
  end

  def audit
    @register = Register.find(params[:id])

    @you_owe_me = YouOweMe.you_owe_me_audit(@register.creditor_id, @register.debtor_id) 
    
    @payment = Payment.payment_audit(@register.creditor_id, @register.debtor_id)
    
    @audit = Audit.audit_math(@you_owe_me, @payment)

    @records = @you_owe_me + @payment

    @sorted_records = @records.sort_by {|item| item.created_at}.reverse

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @register }
    end
  end

  # GET /registers/new
  # GET /registers/new.json
  def new
    @register = Register.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @register }
    end
  end

  # GET /registers/1/edit
  def edit
    @register = Register.find(params[:id])
  end

  # POST /registers
  # POST /registers.json
  def create
    @register = Register.new(params[:register])

    respond_to do |format|
      if @register.save
        format.html { redirect_to @register, notice: 'Register was successfully created.' }
        format.json { render json: @register, status: :created, location: @register }
      else
        format.html { render action: "new" }
        format.json { render json: @register.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /registers/1
  # PUT /registers/1.json
  def update
    @register = Register.find(params[:id])

    respond_to do |format|
      if @register.update_attributes(params[:register])
        format.html { redirect_to @register, notice: 'Register was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @register.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /registers/1
  # DELETE /registers/1.json
  def destroy
    @register = Register.find(params[:id])
    @register.destroy

    respond_to do |format|
      format.html { redirect_to registers_url }
      format.json { head :ok }
    end
  end
end
