require("pry")

class Definition 
  attr_reader :id
  attr_accessor :def, :word_id
  @@total_rows = 0
  @@definitions = {}

  def initialize(attributes)
    @def = attributes.fetch(:def)
    @word_id = attributes.fetch(:word_id)
    @id = attributes.fetch(:id) || @@total_rows += 1
  end

  def self.clear
    @@total_rows = 0
    @@definitions = {}
  end

  def ==(definition_to_compare)
    (self.id == definition_to_compare.id) && (self.def == definition_to_compare.def) && (self.word_id == definition_to_compare.word_id)
  end

  def save
    @@definitions[self.id] = Definition.new({:def => self.def, :word_id => self.word_id, :id => self.id})
  end

  def self.all
    @@definitions.values
  end

  def self.find(id)
    @@definitions[id]
  end

  def update(new_def)
    @def = new_def
  end

  def self.find_by_word(given_id)
    definitions = []
    @@definitions.values.each do |definition|
      if definition.word_id == given_id
        definitions.push(definition)
      end
    end
    definitions
  end

  def delete
    @@definitions.delete(self.id)
  end
  
end