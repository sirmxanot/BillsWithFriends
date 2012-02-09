class YouOweMe < ActiveRecord::Base
	#Calls the update_register method before saving a you_owe_me
	before_create :add_you_owe_me_to_register
	before_update :update_register
	before_destroy :subtract_you_owe_me_from_register

	belongs_to :expense

	default_scope :order => 'created_at DESC'

	validates_presence_of :amount, :creditor_id, :debtor_id
	validates :amount, :numericality => {:greater_than_or_equal_to => 1}
	#Need to add a validation to ensure that you cannot submit a you_owe_me where the debtor and creditor ids are the same

	def self.you_owe_me_audit(creditor_id, debtor_id)
		where(:creditor_id => creditor_id, :debtor_id => debtor_id)
	end

	def self.that_belong_to_expense(expense_id)
		where(:expense_id => expense_id)
	end

	private

	#This method creates a register if it doesn't exist and then adds the you_owe_me.amount to the register.credit_extended
  def add_you_owe_me_to_register
  	register = Register.where(:creditor_id => creditor_id, :debtor_id => debtor_id).first
  	register ||= Register.new(:creditor_id => creditor_id, :debtor_id => debtor_id)

    credit_extended = register.credit_extended + self.amount
    register.update_attributes(:credit_extended => credit_extended)
  end

  def update_register
  	register = Register.where(:creditor_id => creditor_id, :debtor_id => debtor_id).first

    credit_extended = register.credit_extended + (self.amount - self.amount_was)
    register.update_attributes(:credit_extended => credit_extended)
  end

  def subtract_you_owe_me_from_register
  	register = Register.where(:creditor_id => creditor_id, :debtor_id => debtor_id).first

    credit_extended = register.credit_extended - self.amount
    register.update_attributes(:credit_extended => credit_extended)
  end
end
