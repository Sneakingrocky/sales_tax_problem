class LineItem
  attr_accessor :quantity, :imported, :product, :price_in_cents

  def imported?
    imported
  end  

  def sales_tax_in_cents
    tax_calculator = TaxCalculator.new(price_in_cents)
    
    if !TaxExempt.item_exempt?(product)
      tax_calculator.basic_sales_tax_in_cents
    else
      0
    end   
  end 

  def import_tax_in_cents 
    tax_calculator = TaxCalculator.new(price_in_cents)

    if imported?
      tax_calculator.import_duty_tax_in_cents
    else
      0
    end    
  end  

  def total_tax_in_cents
    tax_calculator = TaxCalculator.new(price_in_cents)
    
    total_tax_in_cents = sales_tax_in_cents + import_tax_in_cents
    tax_calculator.round_to_next_nickel(total_tax_in_cents)
  end

  def total_in_cents
    price_in_cents + total_tax_in_cents
  end  
end  