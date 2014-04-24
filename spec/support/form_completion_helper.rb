module FormCompletionHelper
  def fill_out_registration_form(user)
    fill_in 'Username', with: user.username
    fill_in 'Email', with: user.email
    fill_in 'user_password', with: user.password
    fill_in 'user_password_confirmation', with: user.password
  end

  def sign_in_as(user)
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Sign in'
  end

  def fill_out_new_product_form
    visit new_product_path
    fill_in 'Product Name', with: 'Fishsicle'
    fill_in 'Description', with: 'now in peanut butter & sardine flavor'
    fill_in 'Price', with: '5'
    fill_in 'Company Name', with: 'Launch Academy'
    fill_in 'Location', with: 'Bar Harbor, ME'
    fill_in 'Company Website', with: 'www.fishsicles.com'
    fill_in 'Product Website', with: 'www.fishsicles.com'
    attach_file('product_image', Rails.root + 'spec/fixtures/images/pie_eating_contest.jpg')
  end
end
