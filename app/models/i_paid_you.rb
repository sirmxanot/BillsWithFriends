class IPaidYou < ActiveRecord::Base
	belongs_to :payment

	validates_presence_of :paymnent_id, :amount, :payer_id, :receiver_id
	validates :amount, :numericality => {:greater_than_or_equal_to => 1}
	
end
