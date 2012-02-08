class Payment < ActiveRecord::Base
	#Calls the update_register method before saving a payment
	before_create :subtract_payment_from_register
	#before_update :update_register
	before_destroy :add_payment_to_register

	belongs_to :user
	
	default_scope :order => 'created_at DESC'

	validates_presence_of :user_id, :date_paid, :total_amount, :receiver_id
	validates :total_amount, :numericality => {:greater_than_or_equal_to => 1}
	validates_with PaymentValidator

	def self.payment_audit(creditor_id, debtor_id)
		where(:receiver_id => creditor_id, :user_id => debtor_id)
	end

	private

	#This method subtracts the payment.amount to the register.credit_extended
  def subtract_payment_from_register
  	register = Register.where(:creditor_id => receiver_id, :debtor_id => user_id).first
  	
    credit_extended = register.credit_extended - self.total_amount
    register.update_attributes(:credit_extended => credit_extended)
  end

   def update_register
  	#register = Register.where(:creditor_id => receiver_id, :debtor_id => user_id).first
    
    #credit_extended = register.credit_extended + self.total_amount
   	#register.update_attributes(:credit_extended => credit_extended)	
  end

  def add_payment_to_register
  	register = Register.where(:creditor_id => receiver_id, :debtor_id => user_id).first
    
    credit_extended = register.credit_extended + self.total_amount
   	register.update_attributes(:credit_extended => credit_extended)	
  end
end
