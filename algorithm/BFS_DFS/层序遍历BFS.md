## BFS层序遍历
#### 要点： 队列维持当前层所有node 处理完毕后调用下一层

```
def levelOrder(self, root: TreeNode) -> List[List[int]]:
    from collections import deque
    queue = deque([root])
    ans = []
    while queue:
        size = len(queue)
        levels = []
        for _ in range(size):
            node = queue.popleft()
            if not node:
                continue
            levels.append(node.val)
            # 下一层
            queue.append(node.left)
            queue.append(node.right)
        if levels:
            ans.append(levels)
    return ans
```

## 颜色标记法 
#### 虽然是层序遍历 但是一个个节点出来的

```
def levelOrder(self, root: TreeNode) -> List[List[int]]:
    white,gray = 0,1
    stack = [(white,0,root)]
    ans = []
    while stack:
        color,level,node = stack.pop()
        if not node:
            continue
        if color == white:
            stack.append((white,level+1,node.right))
            stack.append((white,level+1,node.left))
            stack.append((gray,level,node))
        else:
            if level == len(ans):
                ans.append([])
            ans[level].append(node.val)
    return ans 
```

## 颜色标记法
```
white,gray = 0,1
stack = [(white,0,root)]
ans = []
while stack:
    color,level,node = stack.pop()
    if not node:
        continue
    if color == white:
        stack.append((white,level+1,node.right))
        stack.append((white,level+1,node.left))
        stack.append((gray,level,node))
    else:
        if level == len(ans):
            ans.append([])
        ans[level].append(node.val)
return [max(x) for x in ans]
```