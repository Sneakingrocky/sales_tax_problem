require './lib/line_item_parser'
require './lib/line_item'

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

  describe "get_price_in_cents" do
    context "Given the price from the parser to turn into cents" do
      let(:input) {"1 bottle of perfume at 18.99"}

      it "takes the parsed price and turns it into cents" do
        expect(parser.get_price_in_cents).to eq(18_99)
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

  describe "self.parse_item" do
    let(:line_item) { LineItemParser.new(input).parse_item }

    context "with '1 imported box of chocolates at 10.00'" do
      let(:input) {"1 imported box of chocolates at 10.00"}

      it "returns a LineItem" do
        expect(line_item).to be_a(LineItem)
      end

      it "sets quantity" do
        expect(line_item.quantity).to eq(1)
      end

      it "sets imported" do
        expect(line_item.imported?).to eq(true)
      end

      it "sets product" do
        expect(line_item.product).to eq("box of chocolates")
      end

      it "sets price_in_cents" do
        expect(line_item.price_in_cents).to eq(10_00)
      end
    end

    context "with '12 roses at 20.33'" do
      let(:input) {"12 roses at 20.33"}

      it "sets quantity" do
        expect(line_item.quantity).to eq(12)
      end

      it "sets imported" do
        expect(line_item.imported?).to eq(false)
      end

      it "sets product" do
        expect(line_item.product).to eq("roses")
      end

      it "sets price_in_cents" do
        expect(line_item.price_in_cents).to eq(20_33)
      end
    end

  end
 
end  

