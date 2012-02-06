class IPaidYou < ActiveRecord::Base
	#Calls the update_register method before saving an i_paid_you
	before_save :update_register

	belongs_to :payment

	default_scope :order => 'created_at DESC'

	validates_presence_of :amount, :payer_id, :receiver_id
	validates :amount, :numericality => {:greater_than_or_equal_to => 1}

	def self.i_paid_you_audit(creditor_id, debtor_id)
		where(:receiver_id => creditor_id, :payer_id => debtor_id)
	end

	private

	#This method subtracts the i_paid_you.amount to the register.credit_extended
  def update_register
  	register = Register.where(:creditor_id => receiver_id, :debtor_id => payer_id).first
  	
    credit_extended = register.credit_extended - self.amount
    register.update_attributes(:credit_extended => credit_extended)

    #This currently fails if there is no matching register. Need to figure out how to prevent that from happening.
  end
end
