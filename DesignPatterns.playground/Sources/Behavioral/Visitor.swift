import Foundation

class VisitorPattern {

    protocol CityVisitor {
        func visit(city: Moscow)
        func visit(city: SaintPetersburg)
        func visit(city: Sochi)
    }

    protocol City {
        var name: String { get }
        func accept(visitor: CityVisitor)
    }

    class Moscow: City {
        
        var name: String { return "Moscow" }
        
        func accept(visitor: CityVisitor) { visitor.visit(city: self) }
        
    }
    
    class SaintPetersburg: City {
        
        var name: String { return "SaintPetersburg" }
        
        func accept(visitor: CityVisitor) { visitor.visit(city: self) }
    }
    
    class Sochi: City {
        
        var name: String { return "Sochi" }
        
        func accept(visitor: CityVisitor) { visitor.visit(city: self) }
    }

    class Visitor: CityVisitor {
        var name = ""
        
        func visit(city: Moscow) {
            name = city.name
        }
        
        func visit(city: Sochi) {
            name = city.name
        }
        
        func visit(city: SaintPetersburg) {
            name = city.name
        }
    }
    
    /*
     
     Usage
     
     let cities: [City] = [Moscow(), SaintPetersburg(), Sochi()]
     let names = cities.map { (city: City) -> String in
     let visitor = Visitor()
     city.accept(visitor: visitor)
     return visitor.name
     }
     
     print(names) // ["Moscow", "SaintPetersburg", "Sochi"]
     
     */

    
}
