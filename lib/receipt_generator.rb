
class ReceiptGenerator
  SALES_TAX_RATE = 0.1
  IMPORT_TAX_RATE = 0.05
  attr_reader :price_in_cents

  def initialize(price_in_cents)
    @price_in_cents = price_in_cents
  end

  def basic_sales_tax_in_cents
    price_in_cents * SALES_TAX_RATE
  end

  def import_duty_tax_in_cents
    price_in_cents * IMPORT_TAX_RATE
  end

  def combined_tax_in_cents
    tax_total = basic_sales_tax_in_cents + import_duty_tax_in_cents
    round_to_next_nickel(tax_total)
  end
  
  def round_to_next_nickel(amount_in_cents)
    amount = (amount_in_cents / 5.0).ceil * 5.0
  end
end