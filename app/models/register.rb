class Register < ActiveRecord::Base
	after_initialize :default_values

	has_one :user

	validates_presence_of :creditor_id, :debtor_id, :credit_extended
	validates :credit_extended, :numericality => {:greater_than_or_equal_to => 0}

	def self.current_user_owns (current_user_id)
		where(:creditor_id => current_user_id)
	end

	def self.current_user_owes (current_user_id)
		where(:debtor_id => current_user_id)
	end

	private
	    def default_values
	      self.credit_extended ||= "0"
	    end
end

# fat model skinny controller
#you're gonna put the book keeping code in a model, or possibly a module under lib/
#the controller is just going to call that method populating an instance variable.. and then the view displays it