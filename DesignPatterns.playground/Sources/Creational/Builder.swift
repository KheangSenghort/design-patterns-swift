import Foundation

class Builder {
    
    class iPhone {
        var name: String?
        var os: String?
        var year: Int?
    }

    class iPhoneBuilder: iPhone {
        let phone: iPhone = iPhone()
        
        func setName(_ name: String) {
            phone.name = name
        }
        
        func setOS(_ os: String) {
            phone.os = os
        }
        
        func setYear(_ year: Int) {
            phone.year = year
        }
    }

    class iPhone5SBuilder: iPhoneBuilder {
        
        func configuration() {
            setName("iPhone5s")
            setOS("iOS 7")
            setYear(2013)
        }
        
    }

    class iPhone7Builder: iPhoneBuilder {
        
        func configuration() {
            setName("iPhone 7")
            setOS("iOS 10")
            setYear(2016)
        }
        
    }

    class iPhoneManager {
        
        var builder: iPhoneBuilder = iPhoneBuilder()
        
        var phone: iPhone {
            return builder.phone
        }
        
        func createPhone() {
            if let builder = builder as? iPhone5SBuilder {
                builder.configuration()
            } else if let builder = builder as? iPhone7Builder {
                builder.configuration()
            }
        }
        
    }

    /*
     
     Usage
     
     let director = iPhoneManager()
     director.builder = iPhone7Builder()
     director.createPhone()
     let iphone7 = director.phone
     
     print(iphone7.name) // iPhone 7
     
     director.builder = iPhone5SBuilder()
     director.createPhone()
     let iphone5s = director.phone
     
     print(iphone5s.name) // iPhone 5s
     
     */
    
}
