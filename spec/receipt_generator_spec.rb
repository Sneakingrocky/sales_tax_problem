require 'spec_helper'
require './lib/receipt_generator.rb'

describe ReceiptGenerator do

  describe "get_sales_tax" do
    it "returns a tax of 1.5 when passed a price of 15" do
      expect(ReceiptGenerator.new.get_sales_tax(15)).to eq(1.5)
    end

    it "returns a tax of 2 when passed a price of 20" do
      expect(ReceiptGenerator.new.get_sales_tax(20)).to eq(2)
    end

    it "returns a tax of 0.4 when passed a price of 4" do
      expect(ReceiptGenerator.new.get_sales_tax(4)).to eq(0.4)
    end
  end

end
