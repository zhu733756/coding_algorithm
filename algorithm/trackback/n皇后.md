## set记录状态

```
 def solveNQueens(self, n: int) -> List[List[str]]:
    rows,cols = n,n
    #状态
    self.pie = set()
    self.na = set()
    self.up = set()
    #结果
    self.ans = []
    self.trace_back(0,n,[])
    return self.ans

def trace_back(self,row,n,board):
    if row == n:
        self.ans.append(["."*idx + "Q" + "."*(n-1-idx) for idx in board])
        return

    for c in range(n):
        if c in self.up or (row-c) in self.na or (row+c) in self.pie:
            continue
        self.up.add(c)
        self.pie.add(row+c)
        self.na.add(row-c)

        self.trace_back(row+1,n,board+[c])

        self.up.remove(c)
        self.pie.remove(row+c)
        self.na.remove(row-c)

```

## 用数组记录状态

```
def solveNQueens(self, n: int) -> List[List[str]]:

    def can_place_in(solvers,row,col):
        for i in range(row):
            if col-1-i>=0 and solvers[row-1-i][col-1-i] =="Q":
                return False
            if solvers[i][col]== "Q":
                return False
            if col+1+i <=n-1 and solvers[row-1-i][col+1+i] =="Q":
                return False
        return True

    def trace_back(row):
        if row == n:
            ans.append(["".join(solvers[i]) for i in range(n)])
            return
        
        for i in range(cols):
            if not can_place_in(solvers,row,i):
                continue
            solvers[row][i] = "Q"
            trace_back(row+1)
            solvers[row][i] = "."

    solvers = [["."]*n for _ in range(n)]
    rows,cols = n,n
    ans=[]
    trace_back(0)
    return ans

```
