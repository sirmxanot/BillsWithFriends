class LedgerController < ApplicationController
	before_filter :authenticate_user!
	
	# GET /payments and expenses
  	# GET /paymentsandexpenses.json
	def index
	    @users_expenses = current_user.expenses
	    @you_owe_mes_user_owes = YouOweMe.user_is_debtor(current_user.id)
	    @users_payments = current_user.payments
	    @payments_user_received = Payment.user_is_receiver(current_user.id)

	    @ledger = @users_expenses + @you_owe_mes_user_owes + @users_payments + @payments_user_received
	    @sorted_ledger = @ledger.sort_by {|item| item.created_at}.reverse


	    respond_to do |format|
	      format.html # index.html.erb
	      format.json { render json: @registers }
	    end
	end
end
