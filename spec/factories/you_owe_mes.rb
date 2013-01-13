FactoryGirl.define do 
  factory :you_owe_me do
    #association :debtor_id, factory: :user
    sequence(:expense) { |e| e }
    amount Random.rand(1...9999)
    sequence(:creditor_id) { |c| c }
    sequence(:debtor_id) { |d| d+1 }
  end
end