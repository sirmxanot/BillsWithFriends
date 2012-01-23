class Payment < ActiveRecord::Base
	#scope :user_owned, payments.where(payment[:owner_id].eq(current_user.id))
end
