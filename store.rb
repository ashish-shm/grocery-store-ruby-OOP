require_relative "groceries"
require_relative "item"
require_relative "cart"

class Store

    def user_input
        puts "Please enter all the items purchased separated by a comma"
        user_input = gets.chomp.gsub(/\s+/, "")
        user_items = user_input.split(',')
        
        if user_items.empty?
            return puts "No Items entered"
        else
            filtered_items = valid_items_check(user_items).tally
            add_to_cart(filtered_items)
        end
    end

    def valid_items_check(user_items)
        valid_items = Groceries::PriceList.keys
        filtered_items = user_items.select{|item|
            valid_items.include?(item)
        }

    end    

    def add_to_cart(items)
        cart = Cart.new
        items.each{|item, quantity|
            cart.add_to_cart(Item.new(item, quantity))
        }
        print cart.items[0].price
    end
 
end

gg = Store.new()
gg.user_input