## 计算一个number的二进制中1的个数
```
class Solution(object):
    def hammingWeight(self,n):
        '''
        :type n:int
        :rtype: int
        '''
        return bin(n).count("1")

class Solution(object):
    def hammingWeight(self,n):
        '''
        :type n:int
        :rtype: int
        '''
        count = 0
        while n != 0:
            n = n&(n-1)
            count += 1
        return count

```