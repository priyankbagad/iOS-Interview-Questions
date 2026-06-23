import Cocoa

// Merge Sort - Split Arrays
func mergeSort(array: [Int]) -> [Int] {
    guard array.count > 1 else {
        return array
    }
    
    let middleIndex = array.count / 2
    let leftArray = Array(array[0..<middleIndex])
    let rightArray = Array(array[middleIndex..<array.count])
    
    return merge(left: mergeSort(array: leftArray), right: mergeSort(array: rightArray))
}

// Optimized Merge Function
func merge(left: [Int], right: [Int]) -> [Int] {
    var mergedArray: [Int] = []
    
    // Use indices instead of removing elements
    var leftIndex = 0
    var rightIndex = 0
    
    // Reserve capacity to avoid frequent re-allocations
    mergedArray.reserveCapacity(left.count + right.count)
    
    while leftIndex < left.count && rightIndex < right.count {
        if left[leftIndex] < right[rightIndex] {
            mergedArray.append(left[leftIndex])
            leftIndex += 1
        } else {
            mergedArray.append(right[rightIndex])
            rightIndex += 1
        }
    }
    
    // Append any remaining elements from either side
    if leftIndex < left.count {
        mergedArray.append(contentsOf: left[leftIndex...])
    }
    if rightIndex < right.count {
        mergedArray.append(contentsOf: right[rightIndex...])
    }
    
    return mergedArray
}

// Test with 50 random numbers
var numbers: [Int] = []
for _ in 0..<50 {
    let randomInt = Int(arc4random_uniform(UInt32(1000)))
    numbers.append(randomInt)
}

print("Original:")
print(numbers)
print("\nSorted:")
print(mergeSort(array: numbers))
