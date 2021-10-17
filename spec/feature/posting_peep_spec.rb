feature 'Posting a peep' do
  
  scenario 'a user can add a peep' do
    visit '/'
    fill_in 'peep', with: 'Hello chitters'
    click_button 'Chit your peep'

    expect(current_path).to eq '/peep/index'
    expect(page).to have_content 'Hello chitters'
  end
end
