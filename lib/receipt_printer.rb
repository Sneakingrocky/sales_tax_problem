require 'cart_parser'

class ReceiptPrinter

  def initialize(cart)
    @cart = cart
  end
  
  def print_receipt
    receipt = ""

    @cart.line_items.each do |item|
      receipt += print_line_item(item)
    end
    receipt += " Sales Taxes: #{format_money(@cart.total_tax_in_cents)}\n"
    receipt += " Total: #{format_money(@cart.total_with_tax)}"
  end

  private

  def format_money(cents)
    sprintf("%.2f", cents/100.0)
  end

  def print_line_item(item)
    "#{item.quantity}#{item.imported? ? " imported" : ""} #{item.product}: #{format_money(item.total_in_cents)}\n"
  end

end  


