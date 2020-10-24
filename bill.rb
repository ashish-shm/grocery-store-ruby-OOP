require_relative "groceries"
require_relative "cart"
require "terminal-table"

class Bill
  attr_reader :total_amount, :saved_amount, :table

  def initialize(items, cart_items)
    @total_amount = total_amount_bill(items)
    @saved_amount = saved_amount_bill(cart_items)
    @table = generate_table(items)
  end

  def total_amount_bill(items)
    total = 0
    items.each{|item|
      total += item.price
    }
  return total
  end

  def saved_amount_bill(cart_items)
    groceries = Groceries::PriceList
    no_discount_price = 0

    cart_items.each do |item, quantity|
      grocery_item = groceries[item]
      no_discount_price += grocery_item.price * quantity
    end

    saved_amount = no_discount_price - @total_amount
  end

  def generate_table(items)
    table_data = []
    items.each{|row|
        table_data << [row.item.capitalize, row.quantity, "$#{row.price}"]
    }
    table = Terminal::Table.new :headings => ['Item', 'Quantity', 'Price'], :rows => table_data, :style => {:width => 35, :border_x => "-", :border_i => "-",:border_top => false, :border_bottom => false, :border_y => ""}
  end
end
