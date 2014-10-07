require 'cart'

class CartParser
  def initialize(input)
    @input = input
  end

  def parse_cart
    Cart.new.tap do |cart|
      parsed_line_items.each do |line_item|
        cart.add_line_item(line_item)
      end
    end
  end

  private

  def parsed_line_items
    @input.split("\n").map do |input_line|
      LineItemParser.new(input_line).parse_item
    end
  end
end