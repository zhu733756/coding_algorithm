## 树递归
```
def levelOrder(self, root: 'Node') -> List[List[int]]:
    def levelorder(root,level):
        if root is None:
            return
        if level == len(ans):
            ans.append([])
        ans[level].append(root.val)         
        for child in root.children:
            levelorder(child,level+1)

    ans = []
    levelorder(root,0)
    return ans
```

## 颜色标记法

```
def levelOrder(self, root: 'Node') -> List[List[int]]:
    white,gray = 0,1
    stack = [(white,root,0)]
    ans = []
    while stack:
        color,node,level = stack.pop()
        if node is None:
            continue
        if color == white:
            for child in node.children[::-1]:
                stack.append((white,child,level+1))
            stack.append((gray,node,level))                 
        else:
            if len(ans) == level:
                ans.append([])
            ans[level].append(node.val)
    return ans
```