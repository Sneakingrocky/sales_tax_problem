require './lib/tax_exempt'


describe TaxExempt do
   
  describe "Items That Are Exempt" do

    it "books are exempt from basic sale tax" do
      expect(TaxExempt.item_exempt?("book")).to eq(true)
    end

    it "returns false is item is not exempt" do
      expect(TaxExempt.item_exempt?("cup")).to eq (false) 
    end

    it "returns true if item is a food" do
      expect(TaxExempt.item_exempt?("chocolate bar")).to eq (true) 
      expect(TaxExempt.item_exempt?("box of chocolates")).to eq (true) 
    end

    it "returns true if item is medicine" do
      expect(TaxExempt.item_exempt?("headache pills")).to eq (true) 
    end
  end
end