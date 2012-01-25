class Expense < ActiveRecord::Base
	belongs_to :user
	has_many :you_owe_mes

	validates_presence_of :id, :expense_name, :owner_id, :date_incurred, :created_at, :total_amount
end
