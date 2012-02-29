class ExpensesController < ApplicationController
  before_filter :authenticate_user!

  # GET /expenses
  # GET /expenses.json
  def index
    @expenses = Expense.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @expenses }
    end
  end

  # GET /expenses/1
  # GET /expenses/1.json
  def show
    @expense = Expense.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @expense }
    end
  end

  # GET /expenses/new
  # GET /expenses/new.json
  def new
    @expense = Expense.new
    @previous_expenses = current_user.expenses
    3.times {@expense.you_owe_mes.build}
    @users = User.all

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @expense }
    end
  end

  # GET /expenses/1/edit
  def edit
    @expense = Expense.find(params[:id])
    @users = User.all

    if @expense.user_id != current_user.id
      flash[:error] = "You can't edit an expense that you didn't create."
      redirect_to @expense
    end  
  end

  # POST /expenses
  # POST /expenses.json
  def create
    @expense = Expense.new(params[:expense])
    @previous_expenses = current_user.expenses
    @users = User.all
    
    respond_to do |format|
      if @expense.save
        format.html { redirect_to @expense, notice: 'Expense was successfully created.' }
        format.json { render json: @expense, status: :created, location: @expense }
      else
        format.html { render action: "new" }
        format.json { render json: @expense.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /expenses/1
  # PUT /expenses/1.json
  def update
    @expense = Expense.find(params[:id])

    if @expense.user_id == current_user.id
      if @expense.update_attributes(params[:expense])
        flash[:success] = 'Expense was successfully updated.'
      else
        render action: "edit"
      end
    else
      flash[:error] = "You can't update an expense that you didn't create."
    end

    redirect_to @expense
  end

  # DELETE /expenses/1
  # DELETE /expenses/1.json
  def destroy
    @expense = Expense.find(params[:id])

    if @expense.user_id == current_user.id
      @expense.destroy
      flash[:success] = "You have successfully deleted the expense."
    else
      flash[:error] = "You can't delete expenses that you didn't create."
    end

    redirect_to expenses_url
  end
end
