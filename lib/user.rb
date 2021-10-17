require 'pg'

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
    connection = PG.connect(dbname: 'chitter_test')
    result = connection.exec_params("INSERT INTO users (email, password, name, username) VALUES($1, $2, $3, $4) RETURNING id, email, password, name, username;", [email, password, name, username])

    User.new(id: result[0]['id'], email: result[0]['email'], password: result[0]['password'], name: result[0]['name'], username: result[0]['username']) 
  end
end
