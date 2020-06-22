
```
def mergesort(array, start, end):
    '''
    @params:
    array : list
    start : int
    end : int
    @return None
    '''
    if start >= end:
        return 
    mid = (start+end) // 2
    mergesort(array,start,mid+1)
    mergesort(array,mid+1,end)
    merge(arr, start, mid, end)

def merge(arr, start, mid, end):
    temp = []
    left,right = start,mid+1
    while left<= mid and right <= end:
        if arr[left] <= arr[right]:
            temp.append(arr[left])
            left += 1
        else:
            temp.append(arr[right])
            right += 1
    if left == mid+1:
        temp += arr[right:end+1]
    if right == end+1:
        temp += arr[left:mid+1]
    arr[start:end+1] = temp[:]
    return arr

```