/*
 The Problem Description
 Your team is building a dashboard that shows the battery status of a fleet of test devices. You are given an array of optional integers [Int?]. These values represent the battery percentages reported by the devices.

 However, because some devices are offline or sleeping, their battery values are turning up as nil.

 Your Goal: Write a function that takes this array of optional integers [Int?] and returns a clean, non-optional array [Int] containing only the devices that have a critical battery level (strictly less than 20%). Any nil values should be ignored completely.
 */

import Foundation

func findCriticalDevices(batteryLevels: [Int?]) -> [Int] {

    var result : [Int] = []

    for level in batteryLevels {

        if let level = level {

            if level < 20 {

                result.append(level)

            }

        }

    }

    

    return result

}
// --- TEST CASES TO CHECK YOUR CODE ---
let testInput: [Int?] = [85, nil, 15, 45, nil, 5, 99, 19, 20]
// Your function should output: [15, 5, 19]
print(findCriticalDevices(batteryLevels: testInput))
