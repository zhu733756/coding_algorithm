```

import heapq

def heap_sort(arr):
    heap_arr = []
    for i in arr:
        heapq.heappush(heap_arr,i)
    for i in range(len(heap_arr)):
        arr[i] = heapq.heappop(heap_arr)


if __name__ == "__main__":
    arr = [12,3,2,1,32,-4,-89,1,5,9]
    heap_sort(arr)
    print(arr)
    
```