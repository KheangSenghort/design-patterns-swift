import Foundation

class Flyweight {
    
    class Actor {
        let name: String
        let skills: Int
        
        var role: String?
        var age: Int?
        
        init() {
            name = "Хью Джекман"
            skills = 80
            print("Создание объекта")
        }
        
        var info: String {
            if let role = role, let age = age {
                return "Роль - \(role), age - \(age)"
            } else {
                return "Нет роли"
            }
        }
    }

    /*
     
     Usage
     
     let jackman = Actor() //Создание объекта
     jackman.info
     
     jackman.role = "Logan"
     jackman.age = 55
     print(jackman.info) // Роль - Logan, age - 55
     
     jackman.role = "Vincent (Chappi)"
     jackman.age = 40
     print(jackman.info) // Роль - Vincent (Chappi), age - 40
     
     jackman.role = "Voljan (Les Miserables)"
     jackman.age = 45
     print(jackman.info) // Роль - Voljan (Les Miserables), age - 45
     
     */
    
}
