import Foundation

class Adapter {
    
    protocol PredatorProtocol {
        func voice()
        func eat()
    }
    
    class Predator: PredatorProtocol {
        
        func voice() {
            print("Ррррррр")
        }
        
        func eat() {
            print("Eм")
        }
        
    }

    class Lion {
        
        func growl() {
            print("Ар-ар")
        }
        
        func gorge() {
            print("Ням")
        }
        
    }

    class LionAdapter: PredatorProtocol {
        
        private let lion: Lion
        
        init(adaptee: Lion) {
            self.lion = adaptee
        }
        
        func voice() {
            lion.growl()
        }
        
        func eat() {
            lion.gorge()
        }
        
    }

    func makePredatorTest(predator: PredatorProtocol) {
        predator.voice()
        predator.eat()
    }

    /*
     
     Usage
     
     let simplePredator = Predator()
     let simpleLion = Lion()
     
     let lionAdapter = LionAdapter(adaptee: simpleLion)
     
     makePredatorTest(predator: simplePredator)
     print("------")
     makePredatorTest(predator: lionAdapter)
     
     */
    
}
