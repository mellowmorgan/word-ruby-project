require 'rspec'
require 'pry'
require 'word'

describe('#Word') do 
  before(:each) do
    @word = Word.new({:term => "luminous", :id => nil})
  end
  describe('initialize') do
    it('should create Word class object with unique id and term attribute luminous') do
      expect(@word.term).to(eq('luminous'))
    end
  end
  describe('save') do
    it('should save word to class object of words and all should should one word object') do
      @word.save
      expect(Word.all).to(eq([@word]))
    end
  end
  # describe('clear') do
  #   it('should')
  #   @words
end