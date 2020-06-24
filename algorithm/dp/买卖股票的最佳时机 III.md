## 未持股，未卖出过股票：说明从未进行过买卖，利润为0
## dp[i][0][0]=0
## 未持股，卖出过1次股票：可能是今天卖出，也可能是之前卖的（昨天也未持股且卖出过）
## dp[i][0][1]=max(dp[i-1][1][0]+prices[i],dp[i-1][0][1])
## 未持股，卖出过2次股票:可能是今天卖出，也可能是之前卖的（昨天也未持股且卖出过）
## dp[i][0][2]=max(dp[i-1][1][1]+prices[i],dp[i-1][0][2])
## 持股，未卖出过股票：可能是今天买的，也可能是之前买的（昨天也持股）
## dp[i][1][0]=max(dp[i-1][0][0]-prices[i],dp[i-1][1][0])
## 持股，卖出过1次股票：可能是今天买的，也可能是之前买的（昨天也持股）
## dp[i][1][1]=max(dp[i-1][0][1]-prices[i],dp[i-1][1][1])
## 持股，卖出过2次股票：最多交易2次，这种情况不存在
## dp[i][1][2]=float('-inf')

```
class Solution:
    def maxProfit(self, prices: List[int]) -> int:
        '''
        状态 天数/购买次数/买卖状态
        '''
        if not prices:
            return 0

        n = len(prices)
        dp = [[[0 for _ in range(2)] for _ in range(3)] for _ in range(n)]
        dp[0][1][0] = float("-inf")
        dp[0][1][1] = -prices[0]
        dp[0][2][0] = float("-inf")
        dp[0][2][1] = float("-inf")

        for i in range(1,n):
            dp[i][1][0] = max(dp[i-1][1][0],dp[i-1][1][1]+prices[i])
            dp[i][1][1] = max(dp[i-1][1][1],-prices[i])
            dp[i][2][0] = max(dp[i-1][2][0],dp[i-1][2][1]+prices[i])
            dp[i][2][1] = max(dp[i-1][2][1],dp[i-1][1][0]-prices[i])
        W
        res = max(dp[n-1][2][0],dp[n-1][1][0])
        return res if res > 0 else 0
```
