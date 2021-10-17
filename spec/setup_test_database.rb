require 'pg'

def setup_test_database
  p 'test datbase in use...'

  connection = PG.connect(dbname: 'chitter_test')

  connection.exec("TRUNCATE peeps, users;")
end
