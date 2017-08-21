FactoryGirl.define do
  factory :user do
    email "foo@bar.com"
    provider "github"
    uid "1a2b3c"
    name "John Smith"
  end
end
