require("pry")

class Definition
  attr_accessor :def, :id
  @@total_rows = 0
  @@definitions = {}
  def initialize(attributes)
    @def = attributes.fetch(:def)
    @id = attributes.fetch(:id) || @@total_rows += 1
  end
  def self.clear
    @@total_rows = 0
    @@definitions = {}
  end
  def ==(definition_to_compare)
    (self.id == definition_to_compare.id) && (self.def == definition_to_compare.def)
  end
  def save
    @@definitions[self.id] = Definition.new({:def => self.def, :id => self.id})
  end
  def self.all
    @@definitions.values
  end
  def self.find(id)
    @@definitions[id]
  end
  # def update

  # end
end