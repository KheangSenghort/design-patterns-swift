import Foundation

class MediatorPattern {
    
    class Sensor {
        let mediator: Mediator
        
        init(_ mediator: Mediator) {
            self.mediator = mediator
        }
        
        func send(message: String) {
            mediator.send(message, sensor: self)
        }
        
        func receive(message: String, sensor: Sensor) {
            
        }
    }

    protocol Mediator {
        func send(_ message: String, sensor: Sensor)
    }
    
    class Computer: Mediator {
        private var sensors: [Sensor] = []
        
        func add(_ sensors: Sensor...) {
            for sensor in sensors {
                self.sensors.append(sensor)
            }
        }
        
        func send(_ message: String, sensor: Sensor) {
            for s in sensors {
                if s !== sensor {
                    sensor.receive(message: message, sensor: s)
                }
            }
        }
    }

    class ConcreteSensor: Sensor {
        let name: String
        
        init(_ name: String, mediator: Mediator) {
            self.name = name
            super.init(mediator)
        }
        
        override func receive(message: String, sensor: Sensor) {
            guard let sensor = sensor as? ConcreteSensor else {
                return
            }
            print("Sensor \(sensor.name) received \(message)")
        }
    }

    /*
     
     Usage
     
     let computer = Computer()
     let camera = ConcreteSensor("camera", mediator: computer)
     let radar = ConcreteSensor("radar", mediator: computer)
     let gps = ConcreteSensor("gps", mediator: computer)
     
     computer.add(camera, radar, gps)
     
     gps.send(message: "lon: 50, lat: 20")
     
     /*
     Sensor camera received lon: 50, lat: 20
     Sensor radar received lon: 50, lat: 20
     */

     
     */
}
