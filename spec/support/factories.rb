FactoryGirl.define do
  factory :user do
    sequence(:first_name) { |n| "Andrew#{n}"}
    sequence(:last_name) { |n| "Frank#{n}"}
    sequence(:email) { |n| "someaddress#{n}@example.com".downcase}
    password "secret"
    password_confirmation "secret"
  end

  factory :you_owe_me do
    association :debtor_id, factory: :user
    expense
  end

  factory :expense do
    sequence(:expense_name) {|e| "Expense Name #{e}"}
    date_incurred Date.today
    total_amount Random.rand(4...99999)
    numb_debtors = Random.rand(1..4)
    after_build do |expense|
      amount = total_amount Kernal.div() numb_debtors
      numb_debtors.times do
        expense.you_owe_mes << FactoryGirl.create(:you_owe_me, 
        amount: amount, creditor_id: user_id, expense: expense.id)
      end
    end
  end
end