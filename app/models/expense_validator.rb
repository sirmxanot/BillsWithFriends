class ExpenseValidator < ActiveModel::Validator

  def validate(record)
  	if future_expense_checker(record)
  		record.errors[:base] << "You can't record expenses for a time in the future"
  	end

    if amounts_equal_total_amount(record)
      record.errors[:base] << "The total of what each individual owes you has to equal the total amount of the expense"
    end
	end

private
	#Makes sure user isn't submitting an expense that occurs in the future.
	def future_expense_checker (record)
		date = record.date_incurred
  	time = date.to_time
  	time.future?
  end

  #Makes sure that the amount of all the you_owe_mes add up to the total_amount of the expense
  def amounts_equal_total_amount (record)
    amount = 0
    record.you_owe_mes.each do |you_owe_me|
      amount += you_owe_me.amount
    end
    return 1 if amount != record.total_amount
  end
end
