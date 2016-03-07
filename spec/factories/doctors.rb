require 'faker'

FactoryGirl.define do
  factory :doctor do |f|
    f.email { Faker::Internet.email }
    f.password { Faker::Internet.password(8) }
  end
end