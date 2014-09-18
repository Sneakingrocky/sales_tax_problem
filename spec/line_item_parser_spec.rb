require 'spec_helper'
require './lib/line_item_parser.rb'

describe LineItemParser do 

  describe "get_quantity" do

    it "gets quantity" do
      input = "1 imported box of chocolates at 10.00"
      parser = LineItemParser.new(input)
      expect(parser.get_quantity).to eq(1)
 
      input = "13878 book at 12.49"
      parser = LineItemParser.new(input)
      expect(parser.get_quantity).to eq(13878)
    end
  end 

  describe "item_imported?" do

    it "returns true when something is imported" do
      input = "1 imported box of chocolates at 10.00"
      parser = LineItemParser.new(input)
      expect(parser.item_imported?).to eq(true)
    end
  
    it "returns false when something is not imported" do
      input = "1 bottle of perfume at 18.99"
      parser = LineItemParser.new(input)
      expect(parser.item_imported?).to eq(false)
    end
  end

  describe "get_price" do

    it "gets the item price" do
      input = "1 imported box of chocolates at 10.00"
      parser = LineItemParser.new(input)
      expect(parser.get_price).to eq(10.00)

      input = "1 book at 12.49"
      parser = LineItemParser.new(input)
      expect(parser.get_price).to eq(12.49)
    end
  end  
end  

