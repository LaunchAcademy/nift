FactoryGirl.define do
  factory :user do
    user_name 'George Jetson'
    email 'gj@gmail.com'
    password '12345678'
  end
end

FactoryGirl.define do
  factory :vote do
    user_id 1
    comment_id 1
    value 1
  end
end

FactoryGirl.define do
  factory :comment do
    user_id 1
    body "I endorse this product"
  end
end
