require 'pg'
require 'user'
require 'BCrypt'

describe User do
  
  describe '.create' do
    it 'creates a new user at sign up' do
      connection = PG.connect(dbname: 'chitter_test')

      user = User.create(email: 'myemail@email.com', password: 'some_password', name: 'Joe Dow', username: 'JoeD')

      expect(user.email).to eq user.email
      expect(user.id).to eq user.id
      expect(user.username).to eq user.username
    end

    it 'hashes the user password with BCrypt' do
      expect(BCrypt::Password).to receive(:create).with('some_password')

      User.create(email: 'test@email.com', password: 'some_password', name: 'test_name', username: 'username')
    end
  end
end
