class Payment < ActiveRecord::Base
	belongs_to :user
	has_one :i_paid_you

	validates_presence_of :id, :owner_id, :date_paid, :created_at, :total_amount
end
