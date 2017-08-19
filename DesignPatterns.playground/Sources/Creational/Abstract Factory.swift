import Foundation

class AbstractFactory {
    
    protocol Factory {
        var laptop: Laptop { get }
        var PC: PC { get }
    }
    
    class Laptop {
        var os: String?
        var name: String?
        var weight: Int?
    }
    
    class PC {
        var os: String?
        var name: String?
    }
    
    class DandelionLaptop: Laptop {
        override init() {
            os = "Windows"
            name = "Laptop Dandelion"
            weight = 1009
        }
    }
    
    class DandelionPC: PC {
        override init() {
            os = "Windows"
            name = "PC Dandelion"
        }
    }
    
    class ChamomileLaptop: Laptop {
        override init() {
            os = "Linux"
            name = "Laptop Chamomile"
            weight = 899
        }
    }
    
    class ChamomilePC: PC {
        override init() {
            os = "Linux"
            name = "PC Chamomile"
        }
    }
    
    
    class DandelionFactory: Factory {
        
        var laptop: Laptop {
            return DandelionLaptop()
        }
        
        var PC: PC {
            return DandelionPC()
        }
        
    }
    
    class ChamomileFactory: Factory {
        
        var laptop: Laptop {
            return ChamomileLaptop()
        }
        
        var PC: PC {
            return ChamomilePC()
        }
        
    }
    
    enum FactoryName {
        case Dandelion, Chamomile
    }
    
    func factory(for name: FactoryName) -> Factory {
        switch name {
        case .Dandelion: return DandelionFactory()
        case .Chamomile: return ChamomileFactory()
        }
    }
    
    /*
     
     Usage
     
     let dandelionFactory = factory(for: .Dandelion) as! DandelionFactory
     let chamomileFactory = factory(for: .Chamomile) as! ChamomileFactory
     let laptop: Laptop = chamomileFactory.laptop
     let pc: PC = dandelionFactory.PC
     
     print(laptop.name)
     print(pc.name)
     */
    
}

