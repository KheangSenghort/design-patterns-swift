import Foundation

class Observer {
    
    class Element {
        
        private var name: String = ""
        
        func set(_ name: String) {
            self.name = name
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "ElementUpdated"), object: self)
        }
        
        func printName() {
            print(name)
        }
        
    }

    class SomeClass {
        
        init() {
            NotificationCenter.default.addObserver(self, selector: #selector(received(_:)), name: Notification.Name(rawValue: "ElementUpdated"), object: nil)
        }
        
        deinit {
            NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue: "ElementUpdated"), object: nil)
        }
        
        @objc func received(_ notification: Notification) {
            guard let element = notification.object as? Element else {
                return
            }
            element.printName()
        }
    }

    /*
        Usage
     
     let some = SomeClass()
     let element = Element()
     element.set("Some Name")
     */
    
}
