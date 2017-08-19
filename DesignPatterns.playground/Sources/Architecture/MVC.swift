import Foundation
import UIKit

class MVC {
    
    struct Student {
        let id: Int
        let name: String
    }
    
    class StudyViewController: UIViewController {
        
        var student: Student!
        
        let startStudyButton = UIButton()
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            startStudyButton.addTarget(self, action: #selector(startStudyDidTap(_:)), for: .touchUpInside)
        }
        
        func startStudyDidTap(_ sender: UIButton) {
            guard student != nil else {
                return
            }
            print("Start study - \(student.name)")
        }
        
    }
    
    
//    Usage
    
//    let model = Student(id: 1, name: "Steve")
//    let vc = StudyViewController()
//    vc.student = model
    
}
