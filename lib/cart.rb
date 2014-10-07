class Cart
  attr_reader :line_items

  def initialize
    @line_items = []
  end

  def add_line_item(line_item)
    @line_items << line_item
  end

  def total_amount_in_cents
    total = 0

    @line_items.each do |line_item|
      total = line_item.price_in_cents + total
    end
    total
  end 


  def total_tax_in_cents
    total = 0

    @line_items.each do |line_item|
      total = line_item.total_tax_in_cents + total
    end
    total
  end    

  def total_with_tax
    total_tax_in_cents + total_amount_in_cents
  end    
end