class RegistersController < ApplicationController
  before_filter :authenticate_user!
  
  # GET /registers
  # GET /registers.json
  def index
    @owes_user = Register.current_user_owns(current_user.id)
    @user_owes = Register.current_user_owes(current_user.id)
    
    @unsorted_registers = @owes_user + @user_owes
    @registers = @unsorted_registers.sort_by {|item| item.updated_at}.reverse

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @registers }
    end
  end

  # GET /registers/1
  # GET /registers/1.json
  def show
    @register = Register.find(params[:id])

    if @register.creditor_id != current_user.id && @register.debtor_id != current_user.id
      flash[:error] = "You can't view a register for which you are not either the creditor or the debtor."
      begin
        redirect_to :back
      rescue Exception
        redirect_to summary_url
      end
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
end
