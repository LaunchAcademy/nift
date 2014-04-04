module FormCompletionHelper
  def fill_in_form(user)
    fill_in 'Email', with: user.email
    fill_in 'user_password', with: user.password
  end

  def fill_out_form(user)
    fill_in 'Username', with: user.username
    fill_in 'Email', with: user.email
    fill_in 'user_password', with: user.password
    fill_in 'user_password_confirmation', with: user.password
  end
end
