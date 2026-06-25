/*
 The Problem Description
 When a WHOOP user finishes an activity, they can add text tags to log details about their workout (e.g., #Cardio, #Outdoor, #Morning, #Strength). Your team needs to clean up these tag inputs before saving them to the database.

 Your Goal: Write a function that takes an array of strings representing raw workout tags. The function should return a clean array of strings that contains only tags that are valid.

 A tag is considered valid if it meets two strict conditions:

 It must start with the hashtag character (#).

 Its total character length must be greater than 3 characters (e.g., #Go is too short, but #Run is valid).
 */


import Foundation

func parseWorkoutTags(rawTags: [String]) -> [String] {
    var result : [String] = []
    for tag in rawTags {
        if tag.hasPrefix("#") && tag.count > 3 {
            result.append(tag)
        }
    }
    
    return result
}

// --- TEST CASES TO CHECK YOUR CODE ---
let dirtyTags = ["#Cardio", "Outdoor", "#HIIT", "#Go", "#Yoga", "Recovery", "#"]
// Your function should output: ["#Cardio", "#HIIT", "#Yoga"]
print(parseWorkoutTags(rawTags: dirtyTags))
