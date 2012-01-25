class YouOweMe < ActiveRecord::Base
	belongs_to :expense

	validates_presence_of :id, :expense_id, :created_at, :amount, :creditor_id, :debtor_id
end
