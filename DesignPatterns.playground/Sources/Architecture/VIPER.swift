import Foundation
import UIKit

protocol AnotherView: class {
    var viewController: UIViewController { get }
}

protocol StudyViewEventHandler {
    func didTapStartStudyButton()
}

protocol StudyView: class {
    func setStudy(_ study: String)
}

protocol StudyProvider {
    func provideStudyData()
}

struct StudyData {
    let studentName: String
}

protocol StudyOutput: class {
    func receiveStudyData(_ studyData: StudyData)
}

class VIPER {

    struct Student {
        let id: Int
        let name: String
    }

    class StudyInteractor: StudyProvider {
        weak var output: StudyOutput!
        
        func provideStudyData() {
            let student = Student(id: 1, name: "Steve")
            let study = StudyData(studentName: student.name)
            self.output.receiveStudyData(study)
        }
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
        
        var viewController: UIViewController {
            return self
        }
        
    }

    class StudyRouter {
        
        let presenter: StudyPresenter = StudyPresenter()
        private var presentedViewController: UIViewController?
        
        func present(from viewController: UIViewController) {
            let newViewController = studyViewController
            viewController.present(newViewController, animated: true, completion: nil)
            presentedViewController = newViewController
        }
        
        func dismiss() {
            presentedViewController?.dismiss(animated: true, completion: nil)
        }
        
        private var studyViewController: StudyViewController {
            let view = StudyViewController()
            let interactor = StudyInteractor()
            view.eventHandler = presenter
            presenter.view = view
            presenter.studyProvider = interactor
            interactor.output = presenter
            return view
        }
        
    }
    
    class AnotherPresenter {
        
        weak var view: AnotherView!
        let router = AnotherRouter()
        
        func presentStudy() {
            router.presentStudy(view)
        }
        
    }
    
    class AnotherRouter {
        
        func presentStudy(_ view: AnotherView) {
            let studyRouter = StudyRouter()
            studyRouter.present(from: view.viewController)
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
