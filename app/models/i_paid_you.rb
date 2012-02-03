class IPaidYou < ActiveRecord::Base
	belongs_to :payment

	default_scope :order => 'created_at DESC'

	validates_presence_of :amount, :payer_id, :receiver_id
	validates :amount, :numericality => {:greater_than_or_equal_to => 1}
end
