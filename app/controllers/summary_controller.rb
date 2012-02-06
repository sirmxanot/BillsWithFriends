class SummaryController < ApplicationController
	before_filter :authenticate_user!
	
	# GET /payments
  	# GET /payments.json
	def index
	    @registers = Register.current_user_owns(current_user.id)

	    respond_to do |format|
	      format.html # index.html.erb
	      format.json { render json: @registers }
	    end
	  end
end
