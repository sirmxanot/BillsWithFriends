class LedgerController < ApplicationController
	before_filter :authenticate_user!
	
	# GET /payments and expenses
  	# GET /paymentsandexpenses.json
	def index
	    @users_expenses = current_user.expenses
	    @users_payments = current_user.payments
	    
	    #NOT FINISHED
	    @expenses_user_owes = Register.current_user_owes(current_user.id)
	    @payments_user_received = 

	    respond_to do |format|
	      format.html # index.html.erb
	      format.json { render json: @registers }
	    end
	end
end
