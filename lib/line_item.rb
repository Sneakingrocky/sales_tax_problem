class LineItem
  attr_accessor :quantity, :imported, :product, :price_in_cents

  def imported?
    imported
  end   
end  