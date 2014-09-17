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
end  

