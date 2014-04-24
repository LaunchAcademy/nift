include ActionDispatch::TestProcess

FactoryGirl.define do
  factory :user, aliases: [:author] do
    sequence(:username) { |n| "George Jetson#{n}" }
    sequence(:email) { |n| "gj#{n}@gmail.com" }
    password '12345678'
  end

  factory :product do
    sequence(:name) {|n| "Product#{n}"}
    description 'description text'
    url 'http://www.amazon.com'
    price '9.99'
    image {fixture_file_upload(Rails.root.to_s + '/spec/fixtures/images/pie_eating_contest.jpg')}
    user
    company
  end

  factory :company do
    sequence(:name) {|n| "Wayne Industries #{n}"}
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
