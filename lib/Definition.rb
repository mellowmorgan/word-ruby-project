require("pry")

class Definition
  attr_accessor :def, :id
  @@total_rows = 0

  def initialize(attributes)
    @def = attributes.fetch(:def)
    @id = attributes.fetch(:id) || @@total_rows += 1
  end

end