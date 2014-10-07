require 'cart_parser'
require 'cart'
require 'line_item'
require 'line_item_parser'

describe CartParser do

  describe "parse_cart" do
    it "parses all the items and puts them in a cart" do
      input = "1 book at 12.49\n" +
              "1 music CD at 14.99\n" +
              "1 chocolate bar at 0.85"
      cart = CartParser.new(input).parse_cart
      expect(cart.line_items.length).to eq(3)
      
      line_item = cart.line_items.first
      expect(line_item.quantity).to eq(1)
      expect(line_item.product).to eq("book")
    end
  end

end