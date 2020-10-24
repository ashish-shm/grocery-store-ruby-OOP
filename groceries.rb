require_relative "grocery_item"

class Groceries

    PriceList = {
        "milk"=> GroceryItem.new('Milk', 3.97, 5, 2),
        "bread"=> GroceryItem.new('Bread', 2.17, 6, 3),
        "banana"=> GroceryItem.new('Banana', 0.99),
        "apple"=> GroceryItem.new('Apple', 0.89)
    }
    
end