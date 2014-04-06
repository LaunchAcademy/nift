require 'spec_helper'
require 'carrierwave/test/matchers'

feature 'user uploads an image', %q{
  As a user creating a post,
  I want to be able to include an image in my post
  So my post is more illustrative and I can get more upvotes.
} do

  #   Acceptance criteria

  # I can include an image upon creating a post
  # I can choose to upload my own photo or link to one on the web
  # A thumbnail of the picture is displayed next to the post
  # Clicking the thumbnail opens the full size pic in a popup

  scenario 'successfully attach an image' do
    user = FactoryGirl.create(:user)
    sign_in_as(user)

    visit new_products_path
    fill_in 'Product Name', with: 'Fishsicle'
    fill_in 'Company Name', with: 'Launch Academy'

    fill_in 'Company Website', with: 'www.fishsicles.com'
    fill_in 'Location', with: 'Bar Harbor, ME'
    fill_in 'Description', with: 'now in peanut butter & sardine flavor'
    fill_in 'Product Website', with: 'www.fishsicles.com'
    fill_in 'Price', with: '5'
    click_on 'Add an image'
    attach_file('Image', '../support/pie_eating_contest.jpg')
    click_on 'Submit'

    product = Product.find(user.id)
    expect(product.image).to include('pie_eating_contest.jpg')
  end

  scenario 'attach an invalid file'
end
