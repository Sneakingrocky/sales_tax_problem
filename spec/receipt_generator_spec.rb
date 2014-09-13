require 'spec_helper'
require './lib/receipt_generator.rb'

describe ReceiptGenerator do

  describe "basic_sales_tax_cents" do

    it "returns a basic sales tax multiplied by the basic sales tax rate in cents" do
      expect(ReceiptGenerator.new(15_00).basic_sales_tax_cents).to eq(1_50)
      expect(ReceiptGenerator.new(20_00).basic_sales_tax_cents).to eq(2_00)
      expect(ReceiptGenerator.new(4_00).basic_sales_tax_cents).to eq(40)
      expect(ReceiptGenerator.new(14_99).basic_sales_tax_cents).to eq(1_49.9)
    end
  end

  describe "import_duty_tax_cents" do

    it "returns an import duty tax multiplied by the import tax rate in cents" do
      expect(ReceiptGenerator.new(15_00).import_duty_tax_cents).to eq(75)
      expect(ReceiptGenerator.new(20_00).import_duty_tax_cents).to eq(100)
      expect(ReceiptGenerator.new(4_00).import_duty_tax_cents).to eq(20) 
      expect(ReceiptGenerator.new(14_99).import_duty_tax_cents).to eq(74.95)
    end
  end    


  describe "combined_tax_cents" do

    it "returns the combined applied basic and import tax in cents" do
      expect(ReceiptGenerator.new(15_00).combined_tax_cents).to eq(225)
      expect(ReceiptGenerator.new(20_00).combined_tax_cents).to eq(300)
      expect(ReceiptGenerator.new(4_00).combined_tax_cents).to eq(60)
      expect(ReceiptGenerator.new(14_99).combined_tax_cents).to eq(225)
      expect(ReceiptGenerator.new(32_13).combined_tax_cents).to eq(485)
    end
  end  

  describe "round_to_next_nickel" do

    it "rounds the the tax in cents to the nearest nickel" do
      expect(ReceiptGenerator.new(4_82).round_to_next_nickel(4_82)).to eq(4_85)
      expect(ReceiptGenerator.new(10_53).round_to_next_nickel(10_53)).to eq(10_55)  
      expect(ReceiptGenerator.new(10_60).round_to_next_nickel(10_60)).to eq(10_60)
    end
  end
end  
