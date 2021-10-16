require 'peep'
require 'pg'

describe Peep do

  describe '.create' do
    it 'adds a new peep' do
      Peep.create(content: 'Just another peep')

      expect(Peep.all).to include('Just another peep')
    end
  end

  describe '.all' do
    it 'should list all peeps in reverse chronological order' do
      connection = PG.connect(dbname: 'chitter_test')
      # connection.exec("INSERT INTO peeps VALUES(1, 'I am happy', '2021-10-16 10:17:30');")
      # connection.exec("INSERT INTO peeps VALUES(2, 'I am ok', '2021-10-16 10:17:35');")
      # connection.exec("INSERT INTO peeps VALUES(3, 'I am fine', '2021-10-16 10:17:40');")

      Peep.create(content: 'I am happy')
      Peep.create(content: 'I am ok')
      peep = Peep.create(content: 'I am fine')
      
      peeps = Peep.all

      # expect(peeps.first).to eq("I am fine")
      # expect(peeps[1]).to eq("I am ok")
      # expect(peeps.last).to eq("I am happy") 

      expect(peeps.length).to eq 3
      expect(peeps.first).to be_a Peep
      expect(peeps.first.id).to eq peep.id
      expect(peeps.first.content).to eq 'I am fine'
      expect(peeps.last.content).to eq 'I am happy'
      expect(peeps.first.created_at).to eq peep.created_at
    end
  end
end