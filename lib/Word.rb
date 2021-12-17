require("pry")

class Word
  attr_accessor :term, :id
  @@total_rows=0
  @@words={}
  def initialize(attributes)
    @term = attributes.fetch(:term)
    @id = attributes.fetch(:id) || @@total_rows += 1
  end

  def ==(word_to_compare)
    (self.term == word_to_compare.term) && (self.id == word_to_compare.id)
  end
  def save
    @@words[self.id] = Word.new({:term => "luminous", :id => self.id})
  end
  def self.all
    @@words.values
  end
  def self.clear
    @@words = {}
    @@total_rows = 0
  end
  def update(term)
    @term = term
  end
  def self.find(id)
    @@words[id]
  end

  def delete
    @@words.delete(self.id)
  end
end