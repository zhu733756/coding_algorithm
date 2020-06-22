## 注意数值小于零的情况

```
def myPow(self, x: float, n: int) -> float:
    if n == 0:
        return 1
    
    half = self.myPow(x,abs(n) //2)
    res = float(x*half*half) if abs(n) % 2 else float(half*half)
    return res if n >= 0 else float(1.0 /res)

 def myPow(self, x: float, n: int) -> float:
    if n == 0:
        return 1
    
    if n > 0 :
        half = self.myPow(x,n //2)
        return float(x*half*half) if n % 2 else float(half*half)
    return 1.0 /self.myPow(x,-n)
```