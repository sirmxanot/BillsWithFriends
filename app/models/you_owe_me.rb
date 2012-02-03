class YouOweMe < ActiveRecord::Base
	before_save :update_register

	belongs_to :expense

	default_scope :order => 'created_at DESC'

	validates_presence_of :amount, :creditor_id, :debtor_id
	validates :amount, :numericality => {:greater_than_or_equal_to => 1}

	private
	  def update_register
	  	creditor_id = self.creditor_id
	  	debtor_id = self.debtor_id

	    if Register.where(:creditor_id => creditor_id, :debtor_id => debtor_id).empty?
				register = Register.new(:creditor_id => creditor_id, :debtor_id => debtor_id)
	    else
	    	register = Register.where(:creditor_id => creditor_id, :debtor_id => debtor_id)
	    end

	    register.credit_extended += self.amount
	  end

	require 'Money'
	composed_of   :amount,
	              :class_name => 'Money',
	              :mapping => %w(amount cents),
	              :constructor => Proc.new { |cents, currency| Money.new(cents || 0, currency ||  Money.default_currency) },
    			  		:converter => Proc.new { |value| value.respond_to?(:to_money) ? value.to_money : raise(ArgumentError, "Can't convert #{value.class} to Money") }
end
