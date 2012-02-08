class ExpenseValidator < ActiveModel::Validator

  def validate(record)
  	if future_expense_checker(record)
  		record.errors[:base] << "You can't record expenses for a time in the future"
  	end

  	#if at_least_one_you_owe_me_checker(record)
  		#record.errors[:base] << "You have to assign at least one participant"
  	#end
	end

private
	#Makes sure user isn't submitting an expense that occurs in the future.
	def future_expense_checker (record)
		date = record.date_incurred
  	time = date.to_time

  	time.future?
  end

  #Makes sure user doesn't submit an expense without any you_owe_mes.
  #def at_least_one_you_owe_me_checker (record)
  	#output = 0
  	#you_owe_mes = YouOweMe.that_belong_to_expense(record.id).count
  	#if you_owe_mes < 1
  		#output = 1
  	#end
  	#output
	#end


end
