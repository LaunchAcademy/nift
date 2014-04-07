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

  scenario 'uploads an image' do
    user = FactoryGirl.create(:user)
    sign_in_as(user)

    visit new_products_path
    fill_out_new_product_form
    attach_file('product_image', Rails.root + 'spec/fixtures/images/pie_eating_contest.jpg')
    click_on 'Submit'

    product = Product.find(user.id)
    expect(product.image).to_not be_nil
    expect(@uploader.small).to have_dimensions(200, 200)
  end

  scenario 'adds an image from a remote url' do
    user = FactoryGirl.create(:user)
    sign_in_as(user)

    visit new_products_path
    fill_out_new_product_form
    fill_in 'or image URL', with: 'http://memeheroes.com/c/99bde-im-bubble-tea.jpg'
    click_on 'Submit'
  end

  scenario 'attach an invalid file'
end
