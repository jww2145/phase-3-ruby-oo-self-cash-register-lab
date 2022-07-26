require 'pry'

class CashRegister
    attr_accessor :discount, :total, :items, :prices

    def initialize(discount=0)
        @total = 0
        @discount = discount
        @items = []
        @prices = []
    end

    def add_item(title, price, quantity = 1)    
        count = 0
        while count < quantity
            self.items << title
            count += 1
        end

        prices.push(price * quantity)
        self.total = prices.sum()
    end

    def apply_discount
        if(self.discount > 0)
            self.total *= (1.0 - (self.discount / 100.0))
            "After the discount, the total comes to $#{self.total}"
        else
            "There is no discount to apply."
        end
    end

    def void_last_transaction
        self.prices.pop()

        if self.items.length() > 0
            return self.total = prices.sum()
        else
            return self.total = 0
        end
        
    end
end