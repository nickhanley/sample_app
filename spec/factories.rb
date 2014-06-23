FactoryGirl.define do
  factory :user do
    name "Nick Hanley"
    email "nick.hanley@gmail.com"
    password "foobar"
    password_confirmation "foobar"
  end
end
