require 'spec_helper'
require './lib/line_item_parser.rb'

describe LineItemParser do
  let(:parser) {LineItemParser.new(input)}


  describe "get_quantity" do

    context "Parser finds quanity with a single-digit quanity" do
      let(:input) {"1 imported box of chocolates at 10.00"}

      it "gets quantity" do
        expect(parser.get_quantity).to eq(1)
      end
    end

    context "Parser finds quanity with a multi-digit quanity" do
      let(:input) {"13878 book at 12.49"}

      it "gets quantity" do
        expect(parser.get_quantity).to eq(13878)
      end
    end
  end
 

  describe "item_imported?" do

    context "Parser is given a string that contains imported" do
      let(:input) {"1 imported box of chocolates at 10.00"}

      it "returns true when something is imported" do
        expect(parser.item_imported?).to eq(true)
      end
    end

    context "Parser is given a string that does not contain imported" do
      let(:input) {"1 bottle of perfume at 18.99"}
  
      it "returns false when something is not imported" do
        expect(parser.item_imported?).to eq(false)
      end
    end
  end
  

  describe "get_price" do

    context "Parser is given a string to find price" do
      let(:input) {"1 imported box of chocolates at 10.00"}

      it "gets the item price" do
        expect(parser.get_price).to eq(10.00)
      end
    end    

    context "Parser is given a string to find a the price" do
      let(:input) {"1 book at 512.49"}

      it "gets the item price" do    
        expect(parser.get_price).to eq(512.49)
      end  
    end
  end
   

  describe "get_product" do

    context "Parser is given a string to find product name of an imported item" do
      let(:input) {"1 imported box of chocolates at 10.00"}

      it "gets the product" do
        expect(parser.get_product).to eq("box of chocolates")
      end
    end  

    context "Parser is given a string to find product name of a non-imported item" do
      let(:input) {"13878 book at 12.49"}

      it "gets the product" do
        expect(parser.get_product).to eq("book")
      end
    end  
  end
 
end  

