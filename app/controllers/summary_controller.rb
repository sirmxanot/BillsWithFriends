class SummaryController < ApplicationController
	before_filter :authenticate_user!
	
	# GET /payments
  	# GET /payments.json
	def index
	    @registers = Register.current_user_owns(current_user.id)
	    #need to add method to get registers where you owe someone else something

	    respond_to do |format|
	      format.html # index.html.erb
	      format.json { render json: @registers }
	    end
	  end
end
