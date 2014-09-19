class LineItemParser

  def initialize(input)
    @input = input
  end

  def get_quantity
    parse_quantity = @input.split(/[^0-9]/)
    parse_quantity[0].to_i
  end

  def item_imported?
    @input.include? "imported"  
  end

  def get_price
    parse_price = @input.split(/ /)
    parse_price[-1].to_f
  end    

  def get_product
    /\d+(?: imported)? (.+) at/.match(@input).captures[0]
  end  
end  