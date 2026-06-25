struct Employee {
    let name: String
    let department: String
    let salary: Double
    let isActive: Bool
    let yearsOfExperience: Int
}

let employees = [
    Employee(name: "Alice", department: "Engineering", salary: 95000, isActive: true, yearsOfExperience: 5),
    Employee(name: "Bob", department: "Design", salary: 72000, isActive: false, yearsOfExperience: 3),
    Employee(name: "Charlie", department: "Engineering", salary: 110000, isActive: true, yearsOfExperience: 8),
    Employee(name: "Dan", department: "Design", salary: 68000, isActive: true, yearsOfExperience: 2),
    Employee(name: "Eve", department: "Engineering", salary: 88000, isActive: false, yearsOfExperience: 6),
    Employee(name: "Frank", department: "Marketing", salary: 75000, isActive: true, yearsOfExperience: 4)
]

//Get All Active Employees
let activeEmployees = employees.filter{$0.isActive}
print(activeEmployees)

//Get Employees with salary above 80000
let highPaidEmployees = employees.filter{$0.salary > 80000}
print(highPaidEmployees)

//Get Names of all Engineering Employees
let engineeringEmployees = employees.filter{$0.department == "Engineering"}.map{$0.name}
print(engineeringEmployees)

//Get total salary of all active employees

var totalSalary = employees.filter{$0.isActive}.reduce(0) {$0 + $1.salary}

//Rule of Thumb for Reduce
/* Adding?      → start at 0
 Multiplying? → start at 1
 String?      → start at ""
 Array?       → start at [] */

//Get employees sorted by years of experience
let sortedYOE = employees.sorted(by: {$0.yearsOfExperience > $1.yearsOfExperience})

//Get names of inactive employees in uppercase
let inactiveEmployee = employees.filter{!$0.isActive}
    .map{$0.name.uppercased()}

//Get average salary of Engineering department
let engineering1Employees = employees.filter { $0.department == "Engineering" }
let total = engineering1Employees.reduce(0) { $0 + $1.salary }
let average = total / Double(engineering1Employees.count)

//Get most experienced active employee
let experiencedEmployee = employees.filter{$0.isActive}.max(by: {$0.yearsOfExperience < $1.yearsOfExperience})

//Get departments without duplicates
let departmentWithoutDuplicates = employees.map{$0.department}
print(Set(departmentWithoutDuplicates))

//Get employees with more than 4 years experience sorted by salary

let filteredEmployees = employees.filter{$0.yearsOfExperience > 4}.sorted(by: {$0.salary > $1.salary})
