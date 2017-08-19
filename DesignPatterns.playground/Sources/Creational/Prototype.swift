import Foundation

class Prototype {
    
    class Student: NSObject, NSCopying {
        var name: String = ""
        
        required override init() {
        }
        
        required init(_ student: Student) {
            name = student.name
        }
        
        public func copy(with zone: NSZone? = nil) -> Any {
            return Student(self)
        }
    }
    
    func logStudent(_ student: Student, for id: Int) {
        print("Student Name \(id) - \(student.name)")
    }
    
    /*
 
    Usage
    
    let studentFirst = Student()
    studentFirst.name = "Alex"
    
    logStudent(studentFirst, for: 1) // Student Name 1 - Alex
    
    let studentSecond = studentFirst.copy() as! Student
    studentSecond.name = "Fedor"
    
    logStudent(studentFirst, for: 1) // Student Name 1 - Alex
    logStudent(studentSecond, for: 2) // Student Name 2 - Fedor
 
    */
    
}
