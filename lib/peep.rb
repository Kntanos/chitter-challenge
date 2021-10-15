require 'time'
require 'pg'

class Peep

  def self.all
    if ENV['RAC_ENV'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec("SELECT * FROM peeps")
    result.map { |peep| peep['content']}
  end

  def self.create(content:, created_at: Time.now)
    if ENV['RAC_ENV'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    connection.exec("INSERT INTO peeps (content, created_at) VALUES ('#{content}', '#{created_at}');")
  end
end