import Foundation

class Command {
    
    class Command {
        let device: String
        
        init(device: String) {
            self.device = device
        }
        
        func execute() -> String {
            return ""
        }
    }

    class On: Command {
        override func execute() -> String {
            return "On " + device
        }
    }
    
    class Off: Command {
        override func execute() -> String {
            return "Off " + device
        }
    }

    class Device {
        let onCommand: Command
        let offCommand: Command
        
        init(device: String) {
            self.onCommand = On(device: device)
            self.offCommand = Off(device: device)
        }
        
        func on() -> String {
            return self.onCommand.execute()
        }
        
        func off() -> String {
            return self.offCommand.execute()
        }
    }

    /*
     
     Usage
     
     let lamp = Device(device: "Lamp")
     lamp.on() // On Lamp
     lamp.off() // Off Lamp
     
     */
    
}
