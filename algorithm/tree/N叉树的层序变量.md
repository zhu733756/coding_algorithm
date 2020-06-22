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
 def preorder(self, root: 'Node') -> List[int]:
    def pretorder(root):
        if root is None:
            return
        ans.append(root.val)             
        for child in root.children:
            pretorder(child)

    ans = []
    pretorder(root)
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
            for child in node.children[::-1]:
                stack.append((white,child))
            stack.append((gray,node))                 
        else:
            ans.append(node.val)
    return ans
```