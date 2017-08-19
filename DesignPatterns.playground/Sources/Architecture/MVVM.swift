import UIKit
import Foundation

class MVVM {

    struct Student {
        
        let id: String
        let name: String
        
    }
    
    struct StudentModel {
        
        var student: Student
        var name: String {
            return "\(student.id) \(student.name)"
        }
        
    }
    
    class StudentViewController: UIViewController {
        
        var student: StudentModel!
        @IBOutlet weak var studentLabel: UILabel!
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            studentLabel.text = student.name
        }
        
    }
    
//    Usage
    
//    let vc = StudentViewController()
//    let student = Student(id: "1", name: "Steve")
//    vc.student = student
    
}
