import Foundation

class ChainOfResponsibility {
    
    class MoneyPacket {
        let value: Int // Значение купюры
        var quantity: Int // Количество купюр в пачке
        var nextPacket: MoneyPacket? // Следующая пачка
        
        init(value: Int, quantity: Int, nextPacket: MoneyPacket?) {
            self.value = value
            self.quantity = quantity
            self.nextPacket = nextPacket
        }
        
        func canWithdraw(_ v: Int) -> Bool {
            var v = v
            func canTakeSameBill(_ want: Int) -> Bool {
                return (want / self.value) > 0
            }
            
            var q = self.quantity
            
            while canTakeSameBill(v) {
                if q == 0 {
                    break
                }
                v -= self.value
                q -= 1
            }
            if v == 0 {
                return true
            } else if let next = self.nextPacket {
                return next.canWithdraw(v)
            }
            return false
        }
    }

    class ATM {
        private var m1000: MoneyPacket
        private var m100: MoneyPacket
        
        private var startPacket: MoneyPacket {
            return self.m1000
        }
        
        init(m1000: MoneyPacket, m100: MoneyPacket) {
            self.m1000 = m1000
            self.m100 = m100
        }
        
        func canWithdraw(value: Int) -> String {
            return "Can withdraw: \(self.startPacket.canWithdraw(value))"
        }
    }

    /*
     
     Usage
     
     let m100 = MoneyPacket(value: 100, quantity: 100, nextPacket: nil)
     let m1000 = MoneyPacket(value: 1000, quantity: 100, nextPacket: m100)
     
     let atm = ATM(m1000: m1000, m100: m100)
     atm.canWithdraw(value: 150000) // Сan withdraw: false
     atm.canWithdraw(value: 75000) // Can withdraw: true
     
     */
    
}
