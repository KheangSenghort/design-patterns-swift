import Foundation

class Bridge {
    
    class Animal {
        
        func voice() {
            print("Ррррр")
        }
        
    }

    class Bird: Animal {
        
        override func voice() {
            print("Чирик")
        }
        
    }
    
    class Horse: Animal {
        
        override func voice() {
            print("Иго-го")
        }
        
    }

    class Zoo {
        
        var animal: Animal?
        
        func presentVoiceAnimal() {
            animal?.voice()
        }
        
    }

    /*
     
     Usage
     
     let zoo = Zoo()
     let bird = Bird()
     let horse = Horse()
     zoo.animal = bird
     zoo.presentVoiceAnimal()
     print("-------")
     zoo.animal = horse
     zoo.presentVoiceAnimal()
     
     */
    
}
