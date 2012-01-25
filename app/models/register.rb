class Register < ActiveRecord::Base
	has_one :user

	validates_presence_of :creator_id, :debtor_id, :credit_extended
	
end
