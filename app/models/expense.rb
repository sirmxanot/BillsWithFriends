class Expense < ActiveRecord::Base
	belongs_to :user
	has_many :you_owe_mes

	validates_presence_of :expense_name, :owner_id, :date_incurred, :total_amount
	validates :total_amount, :numericality => {:greater_than_or_equal_to => 1}
end
