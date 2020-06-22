## 树递归

```
"""
# Definition for a Node.
class Node:
    def __init__(self, val=None, children=None):
        self.val = val
        self.children = children
"""
```

```
def postorder(self, root: 'Node') -> List[int]:
    def pstorder(root):
        if root is None:
            return 
        for child in root.children:
            pstorder(child)
        ans.append(root.val)

    ans = []
    pstorder(root)
    return ans
```

## 颜色标记法

```
def postorder(self, root: 'Node') -> List[int]:
    white,gray = 0,1
    stack = [(white,root)]
    ans = []
    while stack:
        color,node = stack.pop()
        if node is None:
            continue
        if color == white:
            stack.append((gray,node))
            for child in node.children[::-1]:
                stack.append((white,child)) 
        else:
            ans.append(node.val)
    return ans
```