require './lib/receipt_printer'
require './lib/line_item_parser'
require './lib/line_item'
require './lib/tax_calculator'
require './lib/tax_exempt'
require './lib/cart_parser'


describe ReceiptPrinter do
  
  describe "print_receipt" do
    
    it "prints receipt when given a list of items" do
      input = "1 book at 12.49\n" +
              "1 music CD at 14.99\n" +
              "1 chocolate bar at 0.85"
      
      expected_output = "1 book: 12.49\n" +
                        "1 music CD: 16.49\n" +
                        "1 chocolate bar: 0.85\n" +
                        " Sales Taxes: 1.50\n" +
                        " Total: 29.83"

      cart_parser = CartParser.new(input)
      cart = cart_parser.parse_cart
      printer = ReceiptPrinter.new(cart)


      expect(printer.print_receipt).to eq(expected_output)
    end
  
    it "prints receipt when given a list of items" do
      input = "1 imported bottle of perfume at 27.99\n" +
              "1 bottle of perfume at 18.99\n" +
              "1 packet of headache pills at 9.75\n" +
              "1 imported box of chocolates at 11.25"
      
      expected_output = "1 imported bottle of perfume: 32.19\n" +
                        "1 bottle of perfume: 20.89\n" +
                        "1 packet of headache pills: 9.75\n" +
                        "1 imported box of chocolates: 11.85\n" +
                        " Sales Taxes: 6.70\n" +
                        " Total: 74.68"

      cart_parser = CartParser.new(input)
      cart = cart_parser.parse_cart
      printer = ReceiptPrinter.new(cart)

      expect(printer.print_receipt).to eq(expected_output)
    end
  end  
end

