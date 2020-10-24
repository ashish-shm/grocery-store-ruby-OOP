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
            cart_and_bill(filtered_items)
            
        end
    end

    def valid_items_check(user_items)
        valid_items = Groceries::PriceList.keys
        filtered_items = user_items.select{|item|
            valid_items.include?(item)
        }

    end    

    def cart_and_bill(items)
        cart = Cart.new
        items.each{|item, quantity|
            newItem = Item.new(item, quantity)
            cart.add_to_cart(newItem)
        }
        bill = cart.generate_bill(items)
        table = bill.table
        total_amount = bill.total_amount
        saved_amount = bill.saved_amount
        puts table
        puts  "Total price : $#{total_amount.round(2)}"
        puts "You saved $#{saved_amount.round(2)} today." 
    end


end
    

gg = Store.new()
gg.user_input