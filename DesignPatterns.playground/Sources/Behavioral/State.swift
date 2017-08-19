import Foundation

class State {
    
    protocol UserState {
        var isAuthorized: Bool { get }
        var username: String? { get }
    }

    class AuthorizedState: UserState {
        
        let name: String
        
        init(_ name: String) {
            self.name = name
        }
        
        var isAuthorized: Bool { return true }
        var username: String? { return name }
    }
    
    class UnauthorizedState: UserState {
        
        var isAuthorized: Bool { return false }
        var username: String? { return nil }
    }

    class User {
        
        private var state: UserState = UnauthorizedState()
        
        func authorize(name: String) {
            state = AuthorizedState(name)
        }
        
        func logout() {
            state = UnauthorizedState()
        }
        
        func info() {
            print("User is authorized - \(state.isAuthorized), name = \(state.username ?? "nil")")
        }
        
    }

    /*
        Usage
     
     let user = User()
     user.authorize(name: "Fedor")
     user.info() // User is authorized - true, name = Fedor
     user.logout()
     user.info() // User is authorized - false, name = nil
     */
    
}
