require 'rspec'
require 'definition'

describe('#Definition') do
  before(:each) do
    @definition = Definition.new({:def => "to be awe-inspiring", :id => nil})
  end
  describe('#initialize') do
    it('should create Definiton class object with unique id and def attribute') do
      expect(@definition.def).to(eq('to be awe-inspiring'))
    end
  end
end