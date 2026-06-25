enum Priority : Comparable {  // comparable protocol automatically sorts the cases in order from top to bottom as declared in the enum
    
    case high
    case medium
    case low
    
}

class Task {
    
    let name : String
    let priority : Priority
    var isCompleted : Bool = false
    
    init(name: String, priority: Priority) {
        self.name = name
        self.priority = priority
    }
    
}

class TaskManager {
    
    var tasks: [Task] = []
    
    func addTask(name : String, priority : Priority){
        tasks.append(Task(name: name, priority: priority))
    }
    
    func completeTask(name : String){
        tasks.filter({$0.name == name}).first?.isCompleted = true
    }
    
    func getPendingTasks() -> [Task] {
        return tasks.filter({$0.isCompleted == false}).sorted{$0.priority < $1.priority}
    }
    
    func removeTask(name : String){
        tasks.removeAll(where: {$0.name == name})
    }
    
    
}
