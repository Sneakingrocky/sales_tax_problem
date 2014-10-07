require 'spec_helper'
require 'cart'
require 'line_item'

describe Cart do
  let(:cart) {Cart.new}

  
  describe "add_line_item" do
    it "adds the line item to the cart" do
      line_item = LineItem.new(quantity: 1, imported: false, product: "music CD", price_in_cents: 10_00)
      cart.add_line_item(line_item)
      
      expect(cart.line_items).to eq([line_item])
    end
  end

  describe "total_amount_in_cents" do
    it "adds the total amount in cents to the cart" do
      line_item = LineItem.new(quantity: 1, imported: false, product: "music CD", price_in_cents: 10_00)
      cart.add_line_item(line_item)

      expect(cart.total_amount_in_cents).to eq(10_00)
    end
  end  

  describe "total_tax_in_cents" do
    it "adds the total tax in cent to the cart" do
      line_item = LineItem.new(quantity: 1, imported: false, product: "music CD", price_in_cents: 10_00)
      cart.add_line_item(line_item)

      expect(cart.total_tax_in_cents).to eq(1_00)
    end
  end  


  describe "total_with_tax" do
    it "adds the total tax and total amount in cents to the cart" do
      line_item = LineItem.new(quantity: 1, imported: false, product: "music CD", price_in_cents: 10_00)
      cart.add_line_item(line_item)

      expect(cart.total_with_tax).to eq(11_00)
    end
  end  

end
 
