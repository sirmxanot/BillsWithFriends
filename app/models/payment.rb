class Payment < ActiveRecord::Base
	belongs_to :user
	has_one :i_paid_you
end
