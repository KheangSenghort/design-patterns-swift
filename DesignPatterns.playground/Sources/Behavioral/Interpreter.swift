import Foundation

class Intepreter {
    
    protocol IntExpression {
        func evaluate(context: IntContext) -> Int
        func replace(character: Character, intExpression: IntExpression) -> IntExpression
        func copy() -> IntExpression
    }

    class IntContext {
        private var data: [Character: Int] = [:]
        
        func lookup(_ name: Character) -> Int {
            return data[name]!
        }
        
        func assign(intVarExpression: IntVarExpression, value: Int) {
            data[intVarExpression.name] = value
        }
    }

    class IntVarExpression: IntExpression {
        let name: Character
        
        init(name: Character) {
            self.name = name
        }
        
        func evaluate(context: IntContext) -> Int {
            return context.lookup(name)
        }
        
        func replace(character: Character, intExpression: IntExpression) -> IntExpression {
            if name == self.name {
                return intExpression.copy()
            } else {
                return IntVarExpression.init(name: self.name)
            }
        }
        
        func copy() -> IntExpression {
            return IntVarExpression(name: name)
        }
    }

    class AddExpression: IntExpression {
        private var op1: IntExpression
        private var op2: IntExpression
        
        init(op1: IntExpression, op2: IntExpression) {
            self.op1 = op1
            self.op2 = op2
        }
        
        func evaluate(context: IntContext) -> Int {
            return op1.evaluate(context: context) + op2.evaluate(context: context)
        }
        
        func replace(character: Character, intExpression: IntExpression) -> IntExpression {
            return AddExpression(op1: op1.replace(character: character, intExpression: intExpression), op2: op2.replace(character: character, intExpression: intExpression))
        }
        
        func copy() -> IntExpression {
            return AddExpression(op1: op1, op2: op2)
        }
    }

    /*
     
     Usage
     
     var expression: IntExpression?
     let context: IntContext = IntContext()
     
     let a = IntVarExpression(name: "a")
     let b = IntVarExpression(name: "b")
     let c = IntVarExpression(name: "c")
     
     expression = AddExpression(op1: a, op2: AddExpression(op1: b, op2: c)) // a + (b + c)
     context.assign(intVarExpression: a, value: 1)
     context.assign(intVarExpression: b, value: 2)
     context.assign(intVarExpression: c, value: 3)
     
     let result = expression?.evaluate(context: context) // 6
     
     */
    
}
