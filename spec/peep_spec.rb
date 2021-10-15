require 'peep'

describe Peep do

  describe '.create' do
    it 'adds a new peep' do
      Peep.create(content: 'Just another peep')

      expect(Peep.all).to include('Just another peep')
    end
  end

  describe '.all' do
    it 'should list all peeps in reverse chronological order' do
      peeps = Peep.all

      expect(peeps).to include("I am fine")
      expect(peeps).to include("I am ok")
      expect(peeps).to include("I am happy") 
    end
  end
end