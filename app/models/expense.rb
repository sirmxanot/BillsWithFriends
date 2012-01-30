class Expense < ActiveRecord::Base
	belongs_to :user
	has_many :you_owe_mes

	default_scope :order => 'created_at DESC'

	accepts_nested_attributes_for :you_owe_mes, 
								  :allow_destroy => true, 
								  :limit => 10, 
								  :reject_if => proc {|attributes|
    								attributes.all? {|k,v| v.blank?}
			    				  }
	

	validates_presence_of :expense_name, :user_id, :date_incurred, :total_amount
	validates :total_amount, :numericality => {:greater_than_or_equal_to => 1}

	require 'Money'
	composed_of   :total_amount,
	              :class_name => 'Money',
	              :mapping => %w(total_amount cents),
	              :constructor => Proc.new { |cents, currency| Money.new(cents || 0, currency ||  Money.default_currency) },
    			  :converter => Proc.new { |value| value.respond_to?(:to_money) ? value.to_money : raise(ArgumentError, "Can't convert #{value.class} to Money") }
end
# fat model skinny controller
#you're gonna put the book keeping code in a model, or possibly a module under lib/
#the controller is just going to call that method populating an instance variable.. and then the view displays it