module SignInHelper
  def fill_in_form(user)
    fill_in 'Email', with: user.email
    fill_in 'user_password', with: user.password
  end
end
