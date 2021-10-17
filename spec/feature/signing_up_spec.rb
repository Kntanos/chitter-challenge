feature 'Signing up as a user' do
  scenario 'a user can create an account' do
    visit '/'
    click_button 'Sign up'

    expect(page).to have_content "Sign up to Chitter" 
  end

  scenario 'a user can sign up with a valid email' do
    visit '/user/new'
    fill_in(:email, with: 'valid@email.com')
    fill_in(:password, with: 'password')
    fill_in(:name, with: 'name')
    fill_in(:username, with: 'user')
    click_button 'Submit'

    expect(page).to have_content 'Sign up succesful'
  end

  scenario 'a user cannot sign up without a valid email' do
    visit '/user/new'
    fill_in(:email, with: 'not_valid_email')
    fill_in(:password, with: 'password')
    fill_in(:name, with: 'name')
    fill_in(:username, with: 'user')
    click_button 'Submit'

    expect(page).to have_content 'You must provide a valid email'
  end
end
