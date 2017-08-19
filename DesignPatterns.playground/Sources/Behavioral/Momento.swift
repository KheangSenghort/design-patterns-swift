import Foundation

class MomentoPattern {
    
    struct ObjectState {
        var number: Int = 0
        var name: String = ""
    }
    
    class Object {
        
        private var state = ObjectState()
        
        init() {
            state.number = 1
            state.name = "Object"
        }
        
        func change(_ number: Int, name: String) {
            state.number = number
            state.name = name
            
            print("State number - \(state.number), name - \(state.name)")
        }
        
        func currentState() -> ObjectState {
            return state
        }
        
        func set(_ state: ObjectState) {
            self.state = state
            print("Loaded state number - \(state.number), name - \(state.name)")
        }
    }

    class Momento {
        
        let state: ObjectState
        
        init(_ state: ObjectState) {
            self.state = ObjectState(number: state.number, name: state.name)
        }
        
    }

    class Saver {
        private let object = Object()
        private var momento: Momento!
        
        func change(value number: Int, name: String) {
            object.change(number, name: name)
        }
        
        func save() {
            let state = object.currentState()
            momento = Momento(state)
            print("Saved state")
        }
        
        func load() {
            object.set(momento.state)
        }
    }

    /*
        Usage
     
     let saver = Saver()
     
     saver.save() // Saved state
     saver.load() // Loaded state number - 1, name - Object
     saver.change(value: 100, name: "Name") // State number - 100, name - Name
     saver.save() // Saved state
     saver.load() // Loaded state number - 100, name - Name
     
    */
    
}
