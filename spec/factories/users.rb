FactoryGirl.define do
  factory :user do
    sequence(:first_name) { |fn| "Andrew{fn}" }
    sequence(:last_name) { |ln| "Frank{ln}" }
    email { "#{first_name}.#{last_name}@example.com"}
    #sequence(:email) { |n| "someaddress#{n}@example.com".downcase}
    password "secret"
    password_confirmation "secret"
  end
end