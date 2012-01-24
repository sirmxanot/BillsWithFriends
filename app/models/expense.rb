class Expense < ActiveRecord::Base
	belongs_to :user
	has_many :you_owe_mes

end
