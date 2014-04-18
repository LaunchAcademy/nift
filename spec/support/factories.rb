
FactoryGirl.define do
  factory :user, aliases: [:author] do
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

  factory :review do
    rating '5'
    product
    author
  end

  factory :vote do
    value '1'
    user
    review
  end
end
