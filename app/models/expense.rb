class Expense < ActiveRecord::Base
	belongs_to :user
	has_many :you_owe_mes

	default_scope :order => 'created_at DESC'

	accepts_nested_attributes_for :you_owe_mes, 
								  :allow_destroy => true, 
								  :limit => 10, 
								  :reject_if => lambda { |a| a[:debtor_id].blank? }
	# in the future, refactor this lambda so that it also checks if the amount field is blank

	validates_presence_of :expense_name, :user_id, :date_incurred, :total_amount
	validates :total_amount, :numericality => {:greater_than_or_equal_to => 1}
	#Need to add validation that the amounts of the you_owe_mes associated with a given expense sum to exactly the expense.total_amount
end
