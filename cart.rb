class Cart

    attr_reader :items

    def initailize
        @items = []
    end

    def add_to_cart
        @items << item
    end
    
end