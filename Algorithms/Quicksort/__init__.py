__version__ = '1.0.0'

# [Ordenação por Comparação: Quick Sort](https://joaoarthurbm.github.io/eda/posts/quick-sort/#:~:text=Quick%20Sort%20é%20um%20algoritmo%20eficiente%20de%20ordenação.,maiores%20estão%20à%20sua%20direita.)
# [Python Program for QuickSort](https://www.geeksforgeeks.org/python-program-for-quicksort/)


# Variables
data1 = [1, 7, 4, 1, 10, 9, -2]
data2 = [3,8,7,10,0,23,2,1,77,7]
data3 = [1, 7, 4, 1, 10, 9, -2]

# Quicksort
def quickSort(arr):
    if len(arr) <= 1:
        return arr
    else:
        pivot = arr[0]
        left = [x for x in arr[1:] if x < pivot]
        right = [x for x in arr[1:] if x >= pivot]
        return quickSort(left) + [pivot] + quickSort(right)

# Example Usage
print(f"Unsorted Array: {data1}.")

print(f"Unsorted Array: {data2}.")

print(f"Unsorted Array: {data3}.")

sorted_arr1 = quickSort(data1)
sorted_arr2 = quickSort(data2)
sorted_arr3 = quickSort(data3)

print(f"Sorted Array in Ascending Order: {sorted_arr1}.")

print(f"Sorted Array in Ascending Order: {sorted_arr2}.")

print(f"Sorted Array in Ascending Order: {sorted_arr3}.")

print()
print(f"Version: {__version__}")
