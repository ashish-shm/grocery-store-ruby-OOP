require_relative "groceries"

class Item
    attr_reader :name, :price, :quantity

    def initialize(item, quantity)
        @item = item
        @quantity = quantity
        @price = calculate_price
    end

    def calculate_price
        grocery_item = Groceries::PriceList[@item]
        final_price(grocery_item.price, grocery_item.sale_price, grocery_item.sale_qty)
    end

    def final_price(price, sale_price, sale_qty)
        if sale_qty.nil?
            final_price = price * @quantity
        else
            final_price = (@quantity/sale_qty)*(sale_price) + (@quantity%sale_qty)*(price)
        end
    end
    
end


