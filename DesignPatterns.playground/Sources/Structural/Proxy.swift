import Foundation


class Proxy {
    
    protocol Animal {
        var move: String { get }
        var name: String { get }
    }

    class Human: Animal {
        
        var move: String {
            return "walk"
        }
        
        var name: String {
            return "human"
        }
        
    }

    class Doll: Animal {
        
        let owner: Animal
        
        init(owner: Animal) {
            self.owner = owner
        }
        
        var move: String {
            return owner.move
        }
        
        var name: String {
            return owner.name
        }
        
    }

    /*
     
     Usage
     
     let human = Human()
     let doll = Doll(owner: human)
     print(doll.move) // walk
     print(doll.name) // human
     
     */
    
}
