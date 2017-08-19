import Foundation

class Multiton {

    enum SingletonType {
        case A, B
    }
    
    protocol Singleton {
        var type: SingletonType { get }
    }

    class A: Singleton {
        static let shared: A = A()
        var type: SingletonType {
            return .A
        }
    }
    
    class B: Singleton {
        static let shared: B = B()
        var type: SingletonType {
            return .B
        }
    }

    class Multiton {
        
        private static var instances: [Singleton] = [A.shared, B.shared]
        
        static func getInstance(type: SingletonType) -> Singleton {
            return instances.filter { $0.type == type }.first
        }
        
    }
    
}
