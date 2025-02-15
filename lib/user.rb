require 'pg'
require 'BCrypt'

class User 

  attr_reader :id, :email, :password, :name, :username

  def initialize(id:, email:, password:, name:, username:)
    @id = id
    @email = email
    @password = password
    @name = name
    @username = username
  end

  def self.create(email:, password:, name:, username:)
    return false unless is_email?(email)
    encrypted_password = BCrypt::Password.create(password)

    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec_params("INSERT INTO users (email, password, name, username)
    VALUES($1, $2, $3, $4)
    RETURNING id, email, password, name, username;", [email, encrypted_password, name, username])

    User.new(id: result[0]['id'],
      email: result[0]['email'],
      password: result[0]['password'],
      name: result[0]['name'],
      username: result[0]['username']) 
  end
  
  def self.is_email?(email)
    email =~ /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i 
  end
end
