```
class Solution:
    def maxProfit(self, prices: List[int]) -> int:
        count = 0
        for i,price in enumerate(prices):
            if i > 0 and prices[i] > prices[i-1]:
                count += prices[i] - prices[i-1]
        return count
```