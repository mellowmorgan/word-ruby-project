require 'rspec'
require 'pry'
require 'word'

describe('#Word') do 
  before(:each) do
    Word.clear
    @word = Word.new({:term => 'luminous', :id => nil})
    @word.save
  end
  describe('#initialize') do
    it('should create Word class object with unique id and term attribute luminous') do
      expect(@word.term).to(eq('luminous'))
    end
  end
  describe('#save') do
    it('should save word to class object of words and all should should one word object') do 
      expect(Word.all).to(eq([@word]))
    end
  end
  describe('#find') do
    it('should save word to class object of words and all should should one word object') do
      expect(Word.find(1)).to(eq(@word))
    end
  end
  describe('#update') do
    it('should update word term to luminosity') do
    @word.term='luminosity'
      expect(@word.term).to(eq('luminosity'))
    end
    it('should update word term to luminosity sand save to words object') do
    @word.term='luminosity'
    @word.save
      expect(Word.find(1).term).to(eq('luminosity'))
    end
  end
end