class Register < ActiveRecord::Base
	has_one :user

	validates_presence_of :id, :creator_id, :debtor_id, :credit_extended, :updated_at
	
end
