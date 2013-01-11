FactoryGirl.define do 
  factory :you_owe_me do
    association :debtor_id, factory: :user
    expense
  end
end