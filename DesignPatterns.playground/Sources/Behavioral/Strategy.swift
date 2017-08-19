import Foundation

protocol Strategy {
    func result(n1: Int, n2: Int) -> Int
}

class StrategyPattern {
    

    class Calculate {
        private var strategy: Strategy
        
        init(strategy: Strategy) {
            self.strategy = strategy
        }
        
        func change(_ strategy: Strategy) {
            self.strategy = strategy
        }
        
        func result(n1: Int, n2: Int) {
            print("Result \(strategy.result(n1: n1, n2: n2))")
        }
    }

    class MinusStrategy: Strategy {
        func result(n1: Int, n2: Int) -> Int {
            return n1 - n2
        }
    }
    
    class PlusStrategy: Strategy {
        func result(n1: Int, n2: Int) -> Int {
            return n1 + n2
        }
    }

    /*
     Usage
     
     let calculator = Calculate(strategy: PlusStrategy())
     calculator.result(n1: 10, n2: 8) // Result 18
     calculator.change(MinusStrategy())
     calculator.result(n1: 10, n2: 8) // Result 2
     */
}
