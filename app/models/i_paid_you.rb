class IPaidYou < ActiveRecord::Base
	belongs_to :payment

	default_scope :order => 'created_at DESC'

	validates_presence_of :amount, :payer_id, :receiver_id
	validates :amount, :numericality => {:greater_than_or_equal_to => 1}
	
	require 'Money'
	composed_of   :amount,
	              :class_name => 'Money',
	              :mapping => %w(amount cents),
	              :constructor => Proc.new { |cents, currency| Money.new(cents || 0, currency ||  Money.default_currency) },
    			  :converter => Proc.new { |value| value.respond_to?(:to_money) ? value.to_money : raise(ArgumentError, "Can't convert #{value.class} to Money") }
end
