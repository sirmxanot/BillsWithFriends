class Payment < ActiveRecord::Base
	belongs_to :user
	has_one :i_paid_you

	validates_presence_of :owner_id, :date_paid, :total_amount
end
