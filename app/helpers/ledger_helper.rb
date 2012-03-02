module LedgerHelper
	def ledger_builder(record)
    case record
    when Payment
      if record.user_id == current_user.id
        render :partial => 'payment_user_paid', :locals => {:record => record}
      elsif record.receiver_id == current_user.id
      	render :partial => 'payment_user_received', :locals => {:record => record}
      else
      	"This payment record shouldn't be here"
      end
    when Expense
      render :partial => 'expense', :locals => {:record => record}
    when YouOweMe
     	render :partial => 'you_owe_me', :locals => {:record => record}
    else
      "ledger_builder doesn't work with objects of class #{record.class}"
    end
  end
end
