import Foundation


extension Date {
    
    func string(_ format: String = "dd MM yyyy") -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
    
}

/*

Usage

let today = Date()
print(today.string()) // 23 07 2017
print(today.string("dd MMMM yyyy")) //23 July 2017
 */
