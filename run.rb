$LOAD_PATH << File.expand_path('./lib')

require 'line_item'
require 'line_item_parser'
require 'receipt_printer'
require 'tax_exempt'
require 'tax_calculator'
require 'cart'

input = File.read(File.expand_path(ARGV[0])) 
cart_parser = CartParser.new(input)
cart = cart_parser.parse_cart
receipt_printer = ReceiptPrinter.new(cart)

puts receipt_printer.print_receipt
