class PaymentValidator < ActiveModel::Validator
  
  def validate(record)
  
  	if do_you_owe_checker(record)
  		record.errors[:base] << "You don't owe them anything! You can't record payments for those who you do not owe anything."
  	end
	end

	private

	#Makes sure user isn't submitting a payment for someone that they don't owe anything.
	def do_you_owe_checker (record)
		Register.register_for_payment(record.receiver_id, record.user_id).first.nil?
  end

end
