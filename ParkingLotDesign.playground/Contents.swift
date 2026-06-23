enum VehicleType {
    case motorcycle
    case car
    case van
}
enum SpotType {
    case motorcycle
    case car
    case large
}

class ParkingSpot {
    let spotType : SpotType
    var vehicleType : VehicleType?
    var isOccupied : Bool = false
    init(spotType : SpotType){
        self.spotType = spotType
    }
}

class ParkingLot {
    var motorcycleSpots: [ParkingSpot] = []
    var carSpots: [ParkingSpot] = []
    var largeSpots: [ParkingSpot] = []
    
    init() {
        // fill each array with spots
        for _ in 0..<10 {
            motorcycleSpots.append(ParkingSpot(spotType: .motorcycle))
            carSpots.append(ParkingSpot(spotType: .car))
            largeSpots.append(ParkingSpot(spotType: .large))
        }
    }
    
    func remainingSpots() -> Int {
        return motorcycleSpots.filter { !$0.isOccupied }.count +
               carSpots.filter { !$0.isOccupied }.count +
               largeSpots.filter { !$0.isOccupied }.count
    }
    
    func totalSpots() -> Int {
        return motorcycleSpots.count + carSpots.count + largeSpots.count
    }
    
    func isFull() -> Bool {
        return remainingSpots() == 0
    }
    
    func isEmpty() -> Bool{
        return remainingSpots() == totalSpots()
    }
    
    func isFull(for vehicalType: VehicleType) -> Bool {
        
        switch vehicalType{
            
        case .motorcycle :
            return motorcycleSpots.filter { !$0.isOccupied }.count == 0
            
        case .car :
            return carSpots.filter{!$0.isOccupied}.count == 0
            
        case .van :
            return largeSpots.filter{!$0.isOccupied}.count == 0
            
        }
    }
    
    func vanSpotCount() -> Int {
        return largeSpots.filter{$0.vehicleType == .van}.count
    }
    
    func park(vehicle: VehicleType) -> Bool {
        switch vehicle {
        case .motorcycle:
            if let spot = motorcycleSpots.first(where: { !$0.isOccupied }) {
                spot.isOccupied = true; spot.vehicleType = .motorcycle; return true
            }
            if let spot = carSpots.first(where: { !$0.isOccupied }) {
                spot.isOccupied = true; spot.vehicleType = .motorcycle; return true
            }
            if let spot = largeSpots.first(where: { !$0.isOccupied }) {
                spot.isOccupied = true; spot.vehicleType = .motorcycle; return true
            }
            return false
            
        case .car:
            if let spot = carSpots.first(where: { !$0.isOccupied }) {
                spot.isOccupied = true; spot.vehicleType = .car; return true
            }
            if let spot = largeSpots.first(where: { !$0.isOccupied }) {
                spot.isOccupied = true; spot.vehicleType = .car; return true
            }
            return false
            
        case .van:
            let available = largeSpots.filter { !$0.isOccupied }
            if available.count >= 3 {
                available[0].isOccupied = true; available[0].vehicleType = .van
                available[1].isOccupied = true; available[1].vehicleType = .van
                available[2].isOccupied = true; available[2].vehicleType = .van
                return true
            }
            return false
        }
    }
}


//Testing

let lot2 = ParkingLot()
print(lot2.park(vehicle: .motorcycle))  // true
print(lot2.park(vehicle: .car))         // true
print(lot2.park(vehicle: .van))         // true
print(lot2.remainingSpots())            // 25 (30 - 1 - 1 - 3)
print(lot2.vanSpotCount())              // 3
