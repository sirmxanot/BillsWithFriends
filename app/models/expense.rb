class Expense < ActiveRecord::Base
	scope :user_owned, expenses.where(expense[:owner_id].eq(current_user.id))
end
