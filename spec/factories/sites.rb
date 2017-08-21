FactoryGirl.define do
  factory :site do
    short_code "abc123"
    url "https://google.com"
    hits 1
    user
  end
end
