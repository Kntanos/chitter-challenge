require 'peep'

describe Peep do

  describe '.add' do


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