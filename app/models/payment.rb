class Payment < ActiveRecord::Base
	belongs_to :user
	has_one :i_paid_you

	validates_presence_of :owner_id, :date_paid, :total_amount
	validates :total_amount, :numericality => {:greater_than_or_equal_to => 1}
end
