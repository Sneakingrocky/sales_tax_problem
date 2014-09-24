class LineItemParser

  def initialize(input)
    @input = input
  end

  def parse_item
    line_item = LineItem.new

    line_item.quantity = get_quantity
    line_item.imported = item_imported?
    line_item.product = get_product
    line_item.price_in_cents = get_price_in_cents

    line_item
  end

  def get_quantity
    @input.split(/[^0-9]/)[0].to_i
  end

  def item_imported?
    @input.include? "imported"  
  end

  def get_price
    @input.split(/ /)[-1].to_f
  end

  def get_price_in_cents
    price_in_cents = get_price * 100
    price_in_cents.round
  end    

  def get_product
    /\d+(?: imported)? (.+) at/.match(@input).captures[0]
  end 
end  