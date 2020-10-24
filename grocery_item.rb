class GroceryItem
    attr_reader :name, :price, :sale_price, :sale_qty

    def initialize(name, price, sale_price=nil, sale_qty=nil)
        @name = name
        @price = price
        @sale_price = sale_price
        @sale_qty = sale_qty
    end
    
end