
FactoryGirl.define do
  factory :user do
    sequence(:username) { |n| "George Jetson#{n}" }
    sequence(:email) { |n| "gj#{n}@gmail.com" }
    password '12345678'
  end

  factory :product do
    sequence(:name) { |n| "Portable Iceberg Lettuce Synthetic Grinder #{n}"}
    description 'Just your everyday Grinder'
    url 'check out amazon'
    price '9.99'
    user
    company
  end

  factory :company do
    sequence(:name) { |n| "Wayne Industries #{n}"}
    location 'Gotham City'
    url 'www.wayneindustries.com'
  end
end
