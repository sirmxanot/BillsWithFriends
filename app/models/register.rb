class Register < ActiveRecord::Base
	after_initialize :default_values

	has_one :user

	validates_presence_of :creator_id, :debtor_id, :credit_extended
	validates :credit_extended, :numericality => {:greater_than_or_equal_to => 0}
	
	private
	    def default_values
	      self.credit_extended ||= "0"
	    end
end
