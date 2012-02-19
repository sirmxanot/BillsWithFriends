Factory.define :user do |f|
	f.sequence(:first_name) { |n| "Andrew#{n}"}
	f.sequence(:last_name) { |n| "Frank#{n}"}
	f.sequence(:email) { |n| "foo#{n}@example.com "}
	f.password "secret"
	f.password_confirmation "secret"
end