require 'rspec'
require 'definition'

describe('#Definition') do
  before(:each) do
    Definition.clear
    @definition = Definition.new({:def => "to be awe-inspiring", :id => nil})
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

end