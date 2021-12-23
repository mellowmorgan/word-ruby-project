require 'rspec'
require 'definition'
require 'word'

describe('#Definition') do

  before(:each) do
    Word.clear
    Definition.clear
    @word = Word.new({:term => "luminous", :id => nil})
    @definition = Definition.new({:def => "to be awe-inspiring", :word_id => @word.id, :id => nil})
    @definition.save
  end

  describe('#initialize') do
    it('should create Definiton class object with unique id and def attribute') do
      expect(@definition.def).to(eq('to be awe-inspiring'))
    end
  end

  describe('#save') do
    it('should save definition to definitions and have that one object in array when all is called') do
      expect(Definition.all).to(eq([@definition]))
    end
  end

  describe('#find') do
    it('should return object definition when calling find method id 1') do
      expect(Definition.find(1)).to(eq(@definition))
    end
  end

  describe('#update') do
    it('should return new definition when update and def called') do
      @definition.def = "the quality of being luminous"
      expect(@definition.def).to(eq("the quality of being luminous"))
    end
    it('should save updated item to definitions') do
      @definition.def = "the quality of being luminous"
      @definition.save
      expect(Definition.find(1).def).to(eq("the quality of being luminous"))
    end
    it('should save updated item to definitions') do
      @definition.def = "the quality of being luminous"
      @definition.save
      expect(Definition.find(1).def).to(eq("the quality of being luminous"))
    end
  end

  describe('#find_by_word') do
    it('should return array of definitions associated with word_id') do
      expect(Definition.find_by_word(1)).to(eq([
      @definition]))
    end
  end

  describe('#delete') do
    it('should delete from definitions') do
      @definition.delete
      expect(Definition.all).to(eq([]))
    end
  end

end