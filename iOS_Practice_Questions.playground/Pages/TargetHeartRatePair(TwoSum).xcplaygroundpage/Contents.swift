/*
 The Problem Description
 
 Your team is building a feature that looks at a sorted array of target recovery heart rates. We want to find out if there are exactly two different heart rates in the list that add up to a specific target sum.
 
 Your Goal: Write a function that takes an array of sorted integers and a target sum. It should return true if any two numbers add up to that target, and false if they don't.
 
 Constraint: You cannot use nested loops ($O(n^2)$). You must use a left pointer starting at index 0 and a right pointer starting at the last index, moving them inward based on the sum.
 */


import Foundation

func hasTargetSum(rates: [Int], target: Int) -> Bool {
    var left = 0
    var right = rates.count - 1
    
    // ⚠️ Your two-pointer loop goes here
    while left < right {
        let sum = rates[left] + rates[right]
        
        if sum == target {
            return true
        } else if sum < target {
            left += 1
        } else {
            right -= 1
        }
    }
    
    return false
}

// --- TEST CASES TO CHECK YOUR CODE ---
let sortedRates = [45, 50, 60, 75, 90, 110]
// Test 1: 50 + 75 = 125
print(hasTargetSum(rates: sortedRates, target: 125)) // Should print: true

// Test 2: No two numbers add up to 200
print(hasTargetSum(rates: sortedRates, target: 500)) // Should print: false
