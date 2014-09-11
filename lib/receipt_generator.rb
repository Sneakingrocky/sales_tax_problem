class ReceiptGenerator

  def get_basic_sales_tax(price)
    sales_tax_rate = 0.10
    price * sales_tax_rate
  end

  def get_import_duty_tax(price)
    import_tax_rate = 0.05
    price * import_tax_rate  
  end
    
end