class LineItemParser

  def initialize(input)
    @input = input
  end

  def parse_item
    LineItem.new(
      quantity: get_quantity,
      imported: item_imported?,
      product: get_product,
      price_in_cents: get_price_in_cents
    )
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