feature 'Signing up as a user' do
  scenario 'a user can create an account' do
    visit '/'
    click_button 'Sign up'

    expect(page).to have_content "Sign up to Chitter" 
  end

  scenario 'a user can submit their details' do
    visit '/user/new'
    click_button 'Submit'

    expect(page).to have_content 'Sign up succesful'
  end
end