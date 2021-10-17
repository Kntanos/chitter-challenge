require 'pg'

feature 'Viewing peeps' do
  scenario 'user can see all peeps without posting' do
    connection = PG.connect(dbname: 'chitter_test')
    
    # adding some test data
    connection.exec("INSERT INTO peeps VALUES(1, 'I am happy', '#{Time.now}');")
    connection.exec("INSERT INTO peeps VALUES(2, 'I am ok', '#{Time.now}');")
    connection.exec("INSERT INTO peeps VALUES(3, 'I am fine', '#{Time.now}');")

    visit '/'
    click_button 'Show me'

    expect(current_path).to eq '/peep/index'
    expect(page).to have_content "I am fine"
    expect(page).to have_content "I am ok"
    expect(page).to have_content "I am happy" 
  end
end
