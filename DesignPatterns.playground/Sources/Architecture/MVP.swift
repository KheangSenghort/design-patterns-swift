import Foundation
import UIKit

class MVP {
    
    struct User {
        let name: String
    }
    
    protocol RegisterView: class {
        func didRegister(error: Error?)
    }
    
    protocol RegisterViewPresenter {
        init (view: RegisterView?, user: User?)
        func register()
    }
    
    class RegisterPresenter: RegisterViewPresenter {
        
        weak var view: RegisterView?
        var user: User?
        
        required init(view: RegisterView?, user: User?) {
            self.view = view
            self.user = user
        }
        
        func register() {
            view?.didRegister(error: nil)
        }
    }
    
    class RegisterViewController: UIViewController, RegisterView {
        
        var presenter: RegisterPresenter?
        
        lazy var registerButton: UIButton = {
            let button = UIButton(type: .system)
            button.setTitle("Register", for: .normal)
            button.backgroundColor = .gray
            button.addTarget(self, action: #selector(registerButtonPressed), for: .touchUpInside)
            return button
        }()
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            setup()
        }
        
        func setup() {
            view.backgroundColor = .white
            view.addSubview(registerButton)
        }
        
        func registerButtonPressed() {
            presenter?.register()
        }
        
        func didRegister(error: Error?) {
            guard error == nil else {
                print("Error - \(error!.localizedDescription)")
            }
            print("User logged in \(presenter?.user?.name)")
        }
        
    }
    
    /*
     
     Usage
     
     let view = RegisterViewController()
     let model = User(name: "Steve")
     let presenter = RegisterPresenter.init(view: view, user: model)
     view.presenter = presenter
     
     */   
    
}
