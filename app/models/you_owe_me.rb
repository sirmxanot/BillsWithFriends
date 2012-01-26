class YouOweMe < ActiveRecord::Base
	belongs_to :expense

	validates_presence_of :expense_id, :amount, :creditor_id, :debtor_id
	validates :amount, :numericality => {:greater_than_or_equal_to => 1}
end
