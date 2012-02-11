class PaymentValidator < ActiveModel::Validator
  
  def validate(record)
  	if do_you_owe_checker(record)
  		record.errors[:base] << "You don't owe them anything! You can't record payments for those who you do not owe anything."
  	end

  	if future_expense_checker(record)
  		record.errors[:base] << "You can't record payments for a time in the future"
  	end

    if cant_pay_self_checker(record)
      record.errors[:base] << "You can't record payments from you to yourself"
    end
	end

	private

	#Makes sure user isn't submitting a payment for someone that they don't owe anything.
	def do_you_owe_checker (record)
		Register.register_for_payment(record.receiver_id, record.user_id).first.nil?
  end

  #Makes sure user isn't submitting a payment that occurs in the future.
	def future_expense_checker (record)
		date = record.date_paid
  	time = date.to_time
  	time.future?
  end

  def cant_pay_self_checker (record)
    return 1 if record.user_id == record.receiver_id
  end

end
