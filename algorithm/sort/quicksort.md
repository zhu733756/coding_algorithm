
```
def quicksort(array,start,end):
    '''
    @params 
    array: array list -> list
    start: start index -> int
    end : end index -> int
    @return 
    None
    '''
    # stop condition
    if start == end:
        return
    # process
    pivot = partional(array,start,end)
    # recursive
    quicksort(array,start,pivot-1)
    quicksort(array,pivot+1,end)

def partional(array,start,end) -> int:
    '''
    @params 
    array: array list -> list
    start: start index -> int
    end : end index -> int
    @return 
    return index of the pivot -> int
    '''
    pivot,count = end,begin
    for index in range(start,end):
        if array[index] < array[pivot]:
            array[count],array[index] = array[index],array[count]
            count += 1
    array[count],array[pivot]= array[pivot],array[count]
    return count

```