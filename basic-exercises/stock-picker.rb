def stock_picker(prices)
    buy_sell = []
    greatest_profit = 0
    prices.each_with_index do |v, i|
        for j in (i + 1)..(prices.length - 1)
            this_profit = prices[j] - prices[i]
            if this_profit > greatest_profit
                greatest_profit = this_profit
                buy_sell = [i, j]
            end
        end
    end

    buy_sell
end

# Tests
p stock_picker([17,3,6,9,15,8,6,1,10]) # [1,4]
p stock_picker([1,15,2,63,23,11,88,2]) # [0,6]
p stock_picker([100,15,2,63,23,11,88,1]) # [2,6]