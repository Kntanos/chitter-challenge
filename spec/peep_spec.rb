require 'peep'
require 'pg'

describe Peep do

  describe '.create' do
    it 'adds a new peep' do
      peep = Peep.create(content: 'Just another peep')

      expect(peep.content).to eq('Just another peep')
    end
  end

  describe '.all' do
    it 'should list all peeps in reverse chronological order' do
      connection = PG.connect(dbname: 'chitter_test')

      Peep.create(content: 'I am happy')
      Peep.create(content: 'I am ok')
      peep = Peep.create(content: 'I am fine')
      
      peeps = Peep.all

      expect(peeps.length).to eq 3
      expect(peeps.first).to be_a Peep
      expect(peeps.first.id).to eq peep.id
      expect(peeps.first.content).to eq 'I am fine'
      expect(peeps.last.content).to eq 'I am happy'
      expect(peeps.first.created_at).to eq peep.created_at
    end
  end
end