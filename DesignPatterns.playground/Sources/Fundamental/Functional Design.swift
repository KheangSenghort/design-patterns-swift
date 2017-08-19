import Foundation
import UIKit

var sumLabel = UILabel()

func sum(a: Int, b: Int) -> Int {
    return a + b
}

func presentSum() {
    let result = sum(a: 2, b: 2)
    sumLabel.text = "\(result)"
}
