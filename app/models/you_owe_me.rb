class YouOweMe < ActiveRecord::Base
	before_save :update_register

	belongs_to :expense

	default_scope :order => 'created_at DESC'

	validates_presence_of :amount, :creditor_id, :debtor_id
	validates :amount, :numericality => {:greater_than_or_equal_to => 1}

	private
	  def update_register
	  	creditor_id = self.creditor_id
	  	debtor_id = self.debtor_id

	    if Register.where(:creditor_id => creditor_id, :debtor_id => debtor_id).empty?
				register = Register.new(:creditor_id => creditor_id, :debtor_id => debtor_id)
	    else
	    	register = Register.where(:creditor_id => creditor_id, :debtor_id => debtor_id)
	    end

	    register.credit_extended += self.amount

	    #credit_extended = register.credit_extended
	    #credit_extended += self.amount
	    #register.update_attributes(:credit_extended => credit_extended)

	    register.save
	  end
end
