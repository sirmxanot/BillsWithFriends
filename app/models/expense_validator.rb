class ExpenseValidator < ActiveModel::Validator

  def validate(record)
  	if future_expense_checker(record)
  		record.errors[:base] << "You can't record expenses for a time in the future"
  	end
	end

private
	#Makes sure user isn't submitting an expense that occurs in the future.
	def future_expense_checker (record)
		date = record.date_incurred
  	time = date.to_time
  	time.future?
  end
end
