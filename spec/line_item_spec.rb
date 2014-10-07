require './lib/line_item'
require './lib/tax_calculator'
require './lib/tax_exempt'

describe LineItem do
  let(:line_item) do
    LineItem.new(quantity: quantity, imported: imported, product: product, price_in_cents: price_in_cents)
  end
  let(:imported) {false}
  let(:product) { "music CD" }
  let(:quantity) { 1 }
  let(:price_in_cents) { 10_00 }

  describe "sales_tax_in_cents" do
    
    context "non exempt item" do
      let(:imported) {false}
      let(:product) { "music CD" }
      let(:quantity) { 1 }
      let(:price_in_cents) { 10_00 }

      it "calculates tax in cents of a line item" do
        expect(line_item.sales_tax_in_cents).to eq(1_00)
      end
    end  

    context "exempt item" do
      let(:imported) {false}
      let(:product) { "packet of headache pills" }
      let(:quantity) { 1 }
      let(:price_in_cents) { 9_75}

      it "returns 0 tax for an exempt item" do
        expect(line_item.sales_tax_in_cents).to eq(0)
      end
    end
  end

  describe "import_tax_in_cents" do

    context "imported item" do
      let(:imported) {true}
      let(:product) { "box of chocolates" }
      let(:quantity) { 1 }
      let(:price_in_cents) { 10_00 }

      it "calculates tax in cents of an imported line item" do
        expect(line_item.import_tax_in_cents).to eq(50)
      end
    end

    context "non imported item" do
      let(:imported) {false}
      let(:product) { "packet of headache pills" }
      let(:quantity) { 1 }
      let(:price_in_cents) { 9_75 }

      it "returns 0 tax for an item that is not imported " do
        expect(line_item.import_tax_in_cents).to eq(0)
      end
    end
  end


  describe "total tax" do

    context "imported item with basic sales tax" do

      it "adds the two taxes together" do
        allow(line_item).to receive(:sales_tax_in_cents).and_return(5_00)
        allow(line_item).to receive(:import_tax_in_cents).and_return(1_00)
        expect(line_item.total_tax_in_cents).to eq(6_00)
      end
      
      it "adds round the total tax to the nearest nickel" do
        allow(line_item).to receive(:sales_tax_in_cents).and_return(5_63)
        allow(line_item).to receive(:import_tax_in_cents).and_return(1_89)
        expect(line_item.total_tax_in_cents).to eq(7_55)
      end
    end
  end

  describe "total_in_cents" do

    context "calculates the total of the line item" do

      it "adds the two taxes together" do
        allow(line_item).to receive(:total_tax_in_cents).and_return(1_00)
        allow(line_item).to receive(:price_in_cents).and_return(32_19)

        expect(line_item.total_in_cents).to eq(33_19)
      end
    end
  end

  describe "imported_string" do
    let(:imported) {true}
    let(:product) { "box of chocolates" }
    let(:quantity) { 1 }
    let(:price_in_cents) { 10_00 }

    it "returns 'imported' if item is imported" do
      expect(line_item.imported_string).to eq("imported")
    end  
  end
end  


