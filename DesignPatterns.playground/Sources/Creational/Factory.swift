import Foundation
import UIKit

protocol ObjectProtocol {
    var color: UIColor { get }
    var number: Int { get }
    var name: String { get }
}

class FactoryPattern {
    
    enum ObjectType {
        case plane, helicopter
    }
    
    class Plane: ObjectProtocol {
        var color: UIColor {
            return .white
        }
        
        var number: Int {
            return 97501
        }
        
        var name: String {
            return "Plane"
        }
    }
    
    class Helicopter: ObjectProtocol {
        var color: UIColor {
            return .gray
        }
        
        var number: Int {
            return 84521
        }
        
        var name: String {
            return "Helicopter"
        }
    }
    
    
    class Factory {
        static func createObject(_ type: ObjectType) -> ObjectProtocol {
            switch type {
            case .plane: return Plane()
            case .helicopter: return Helicopter()
            }
        }
    }
    
    /*
     
     Usage
     
     let plane = Factory.createObject(.plane)
     print(plane.name)
     
     let helicopter = Factory.createObject(.helicopter)
     print(helicopter.name)
     
     */

    
}
