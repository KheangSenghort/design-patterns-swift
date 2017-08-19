import Foundation

class Facade {
    
    enum Storage {
        
        static func set(_ value: Any?, for key: String) {
            let defaults = UserDefaults.standard
            defaults.set(value, forKey: key)
            defaults.synchronize()
        }
        
        static func object(for key: String) -> Any? {
            let defaults = UserDefaults.standard
            return defaults.value(forKey: key)
        }
        
    }

    /*
     
     Usage
     
     Storage.set("Alex", for: "name")
     print(Storage.object(for: "name"))
     
     */
    
}
