require("pry")

class Word
  attr_accessor :term, :id
  @@total_rows=0
  def initialize(attributes)
    @term = attributes.fetch(:term)
    @id = attributes.fetch(:id) || @@total_rows += 1
  end

  def ==(word_to_compare)
    (self.term == word_to_compare.term) && (self.id == word_to_compare.id)
  end

end