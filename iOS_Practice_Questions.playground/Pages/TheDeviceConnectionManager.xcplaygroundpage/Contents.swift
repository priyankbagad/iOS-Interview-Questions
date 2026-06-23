/* 
 The Problem Description
 You are building the internal tracking system for a WHOOP strap connection manager.

 Create a class called DeviceManager.

 The class needs to track two things:

 A string property for the deviceName.

 A boolean property called isConnected.

 Add an initializer (init) to set the device name when creating the manager. (By default, a new device starts as isConnected = false).

 Write a function inside the class called toggleConnection() that flips the connection state (if it’s true, make it false; if it’s false, make it true).
 */



import Foundation

// ⚠️ Write your DeviceManager class here

class DeviceManager {
    
    let deviceName : String
    var isConnected : Bool = false
    
    init(deviceName : String){
        self.deviceName = deviceName
    }
    
    //Methods
    
    func toggleConnection() {
        isConnected = !isConnected
    }
    
}


// --- TEST CASES TO CHECK YOUR CODE ---
let manager = DeviceManager(deviceName: "WHOOP 4.0")
print(manager.isConnected) // Should print: false

manager.toggleConnection()
print(manager.isConnected) // Should print: true

manager.toggleConnection()
print(manager.isConnected) // Should print: false
