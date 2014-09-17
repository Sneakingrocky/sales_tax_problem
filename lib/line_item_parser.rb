class LineItemParser

  def initialize(input)
    @input = input
  end

  def get_quantity
    parse_quantity = @input.split(/[^0-9]/)
    parse_quantity[0].to_i
  end
end  