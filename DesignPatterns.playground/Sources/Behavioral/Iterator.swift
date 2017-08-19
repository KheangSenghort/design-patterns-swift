import Foundation


class Iterator {
    
    class ElementsIterator: Sequence {
        let names: [String]
        var index: Int = 0
        
        init(_ names: String...) {
            self.names = names
        }
        
        func makeIterator() -> AnyIterator<String> {
            return AnyIterator {
                if self.names.count > self.index {
                    self.index += 1
                    return self.names[self.index - 1]
                } else {
                    return nil
                }
            }
        }
    }
    
    /*
 
    Usage
 
    let elements = ElementsIterator("FirstName", "SecondName", "LastName")
    for element in elements {
    print(element) // FirstName, SecondName, LastName
    }
     
    */

    
}
