class Payment < ActiveRecord::Base
	belongs_to :user
	has_one :i_paid_you, :dependent => :destroy
	
	accepts_nested_attributes_for :i_paid_you, 
																:allow_destroy => true,
																:limit => 1, 
																:reject_if => lambda { |a| a[:receiver_id].blank? }
	# in the future, refactor this lambda so that it also checks if the amount field is blank
	
	default_scope :order => 'created_at DESC'

	validates_presence_of :user_id, :date_paid, :total_amount
	validates :total_amount, :numericality => {:greater_than_or_equal_to => 1}
end
