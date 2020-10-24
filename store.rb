require_relative "groceries"

class Store

    def user_input
        puts "Please enter all the items purchased separated by a comma"
        user_input = gets.chomp.gsub(/\s+/, "")
        user_items = user_input.split(',')
        
        if user_items.empty?
            return puts "No Items entered"
        else
            filtered_items = valid_items_check(user_items).tally
            
        end
    end

    def valid_items_check(user_items)
        valid_items = Groceries::PriceList.keys
        filtered_items = user_items.select{|item|
            valid_items.include?(item)
        }

    end    
 
end

gg = Store.new()
gg.user_input