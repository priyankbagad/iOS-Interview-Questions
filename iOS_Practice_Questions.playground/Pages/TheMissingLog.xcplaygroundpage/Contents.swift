/*
 The Problem Description
 Your team is analyzing sensor transmission packets. Each packet sends a string identifier code. In a perfect transmission stream, every identifier code should appear exactly twice (a start packet and an end packet).

 However, due to a network drop, one specific packet code was corrupted, and its matching pair is missing—meaning it appears exactly once.

 Your Goal: Write a function that takes an array of packet strings and returns the single packet identifier that appears exactly once. You must solve this efficiently without nesting loops.
 */

import Foundation

func findCorruptedPacket(packets: [String]) -> String? {
    var packetsDict : [String : Int] = [:]
    
    for packet in packets {
        packetsDict[packet, default : 0] += 1
    }
    
    for (packet, value) in packetsDict {
        if value == 1 {
            return packet // You can return immediately as soon as you find it!
        }
    }
    return nil
    }

// --- TEST CASES TO CHECK YOUR CODE ---
let stream = ["A1", "B2", "C3", "B2", "A1"]
// "C3" appears once, while "A1" and "B2" appear twice.
// Your function should output: "C3"
print(findCorruptedPacket(packets: stream) ?? "None found")
