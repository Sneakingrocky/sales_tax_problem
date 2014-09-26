class TaxExempt

  EXEMPT_ITEMS = ["book", 
                  "chocolate bar", 
                  "box of chocolates", 
                  "packet of headache pills"]

  def self.item_exempt?(item)
    EXEMPT_ITEMS.include? item
  end
end