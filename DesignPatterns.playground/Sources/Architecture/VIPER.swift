import Foundation
import UIKit

class VIPER {

    struct Student {
        let id: Int
        let name: String
    }

    struct StudyData {
        let studentName: String
    }
    
    protocol StudyProvider {
        func provideStudyData()
    }
    
    protocol StudyOutput: class {
        func receiveStudyData(_ studyData: StudyData)
    }

    class StudyInteractor: StudyProvider {
        weak var output: StudyOutput!
        
        func provideStudyData() {
            let student = Student(id: 1, name: "Steve")
            let study = StudyData(studentName: student.name)
            self.output.receiveStudyData(study)
        }
    }

    protocol StudyViewEventHandler {
        func didTapStartStudyButton()
    }
    
    protocol StudyView: class {
        func setStudy(_ study: String)
    }
    
    class StudyPresenter: StudyOutput, StudyViewEventHandler {
        weak var view: StudyView!
        var studyProvider: StudyProvider!
        
        func didTapStartStudyButton() {
            self.studyProvider.provideStudyData()
        }
        
        func receiveStudyData(_ studyData: StudyData) {
            self.view.setStudy("Start for \(studyData.studentName)")
        }
    }

    class StudyViewController: UIViewController, StudyView {
        var eventHandler: StudyViewEventHandler!
        let startStudyButton = UIButton()
        let studyLabel = UILabel()
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            startStudyButton.addTarget(self, action: #selector(didTapStartStudyButton), for: .touchUpInside)
        }
        
        func didTapStartStudyButton() {
            eventHandler.didTapStartStudyButton()
        }
        
        func setStudy(_ study: String) {
            studyLabel.text = study
        }
    }

    /*
     
     Usage
     
     let view = StudyViewController()
     let presenter = StudyPresenter()
     let interactor = StudyInteractor()
     view.eventHandler = presenter
     presenter.view = view
     presenter.studyProvider = interactor
     interactor.output = presenter
     
     */
    
}
