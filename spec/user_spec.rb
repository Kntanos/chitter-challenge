require 'pg'
require 'user'

describe User do
  
  describe '.create' do
    it 'creates a new user at sign up' do
      connection = PG.connect(dbname: 'chitter_test')

      user = User.create(email: 'myemail@email.com', password: 'somepassword', name: 'Joe Dow', username: 'JoeD')

      expect(user.email).to eq user.email
    end
  end
end