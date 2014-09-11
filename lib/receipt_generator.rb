class ReceiptGenerator

  def get_sales_tax(price)
    sales_tax_rate = 0.10
    price * sales_tax_rate
  end
end