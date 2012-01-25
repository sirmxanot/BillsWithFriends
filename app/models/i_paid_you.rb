class IPaidYou < ActiveRecord::Base
	belongs_to :payment

	validates_presence_of :id, :paymnent_id, :created_at, :amount, :payer_id, :receiver_id
	
end
