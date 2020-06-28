## 
```
class LRUCache:

    def __init__(self, capacity: int):
        self.lrucache = collections.OrderedDict()
        self.capacity = capacity


    def get(self, key: int) -> int:
        if key in self.lrucache:
            self.lrucache.move_to_end(key)
        return self.lrucache.get(key,-1)


    def put(self, key: int, value: int) -> None:
        if key in self.lrucache:
            self.lrucache.pop(key)
        self.lrucache[key] = value
        if self.capacity < len(self.lrucache):
            self.lrucache.popitem(last=False)
```