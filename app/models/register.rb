class Register < ActiveRecord::Base
	after_initialize :default_values

  # Setup accessible (or protected) attributes for your model
  attr_accessible :credit_extended

	has_one :user

	validates_presence_of :creditor_id, :debtor_id, :credit_extended
	validates :credit_extended, :numericality => {:greater_than_or_equal_to => 0}

	private
	    def default_values
	      self.credit_extended ||= "0"
	    end
end

# fat model skinny controller
#you're gonna put the book keeping code in a model, or possibly a module under lib/
#the controller is just going to call that method populating an instance variable.. and then the view displays it