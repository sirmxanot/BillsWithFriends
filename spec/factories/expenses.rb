FactoryGirl.define do  
  factory :expense do
    sequence(:expense_name) {|e| "Expense Name #{e}"}
    date_incurred Date.today
    total_amount Random.rand(4...99999)
    numb_debtors = Random.rand(1..4)
    after_build do |expense|
      amount = total_amount / numb_debtors 
      numb_debtors.times do
        expense.you_owe_mes << FactoryGirl.build(:you_owe_me, 
        :amount => amount, :creditor_id => user_id, :expense => expense.id)
      end
    end
  end
end