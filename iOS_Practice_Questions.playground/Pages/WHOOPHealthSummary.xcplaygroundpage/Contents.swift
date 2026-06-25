//Struct User
import Foundation

struct User {
    let id = UUID()
    let name: String
}

enum RecoveryScore {
    case poor
    case moderate
    case good
}

struct HealthSummary {
    let userId : UUID
    let heartRate: Int
    let recoveryScore : RecoveryScore
    let sleepDuration : Int?
}

protocol DisplayHealthSummary{
    func displayHeartRate() -> String
    func displayRecoveryScore() -> String
    func displaySleepDuration() -> String
}

class ViewModel : DisplayHealthSummary{
    
    var user : User
    var summary : HealthSummary
    
    init(user: User, summary: HealthSummary) {
        self.user = user
        self.summary = summary
    }
    
    func displayHeartRate() -> String {
        return "Your Heart Rate is \(summary.heartRate)"
    }
    
    func displayRecoveryScore() -> String {
        switch summary.recoveryScore {
        case .poor: return "Your Recovery Score is Poor 🔴"
        case .moderate: return "Your Recovery Score is Moderate 🟡"
        case .good: return "Your Recovery Score is Good 🟢"
        }
    }
    
    func displaySleepDuration() -> String {
        if let sleep = summary.sleepDuration {
            return "Your Sleep Duration is \(sleep) hrs"
        }
        return "N/A"
    }
    
}


//TEST

let user = User(name: "Priyank")
let summary = HealthSummary(
    userId: user.id,
    heartRate: 72,
    recoveryScore: .good,
    sleepDuration: 7
)

let vm = ViewModel(user: user, summary: summary)
print(vm.displayHeartRate())
print(vm.displayRecoveryScore())
print(vm.displaySleepDuration())

// Test nil sleep
let summary2 = HealthSummary(
    userId: user.id,
    heartRate: 65,
    recoveryScore: .poor,
    sleepDuration: nil
)

let vm2 = ViewModel(user: user, summary: summary2)
print(vm2.displaySleepDuration())

