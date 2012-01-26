class Register < ActiveRecord::Base
	after_initialize :default_values

	has_one :user

	validates_presence_of :creator_id, :debtor_id, :credit_extended
	validates :credit_extended, :numericality => {:greater_than_or_equal_to => 0}
	
	private
	    def default_values
	      self.credit_extended ||= "0"
	    end

	require 'Money'
	composed_of   :credit_extended,
	              :class_name => 'Money',
	              :mapping => %w(credit_extended cents),
	              :constructor => Proc.new { |cents, currency| Money.new(cents || 0, currency ||  Money.default_currency) },
    			  :converter => Proc.new { |value| value.respond_to?(:to_money) ? value.to_money : raise(ArgumentError, "Can't convert #{value.class} to Money") }
end
