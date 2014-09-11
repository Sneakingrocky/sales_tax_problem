require 'spec_helper'
require './lib/receipt_generator.rb'

describe ReceiptGenerator do

  describe "get_basic_sales_tax" do
    it "returns a basic tax of 1.5 when passed a price of 15" do
      expect(ReceiptGenerator.new.get_basic_sales_tax(15)).to eq(1.5)
    end

    it "returns a basic tax of 2 when passed a price of 20" do
      expect(ReceiptGenerator.new.get_basic_sales_tax(20)).to eq(2)
    end

    it "returns a basic tax of 0.4 when passed a price of 4" do
      expect(ReceiptGenerator.new.get_basic_sales_tax(4)).to eq(0.4)
    end
  end

  describe "get_import_duty_tax" do
    it "returns an import duty tax of .75 when passed a price of 15" do
      expect(ReceiptGenerator.new.get_import_duty_tax(15)).to eq(0.75)
    end  

    it "returns an import duty tax of 1 when passed a price of 20" do
      expect(ReceiptGenerator.new.get_import_duty_tax(20)).to eq(1)
    end  

    it "returns an import duty tax of .75 when passed a price of 15" do
      expect(ReceiptGenerator.new.get_import_duty_tax(4)).to eq(0.2)
    end  
  end  
end
