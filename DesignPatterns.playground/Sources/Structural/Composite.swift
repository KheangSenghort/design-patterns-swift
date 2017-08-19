import Foundation

class Composite {
    
    protocol Shape {
        func draw(color: String)
    }

    class Square: Shape {
        func draw(color: String) {
            print("Рисуем квадрат с цветом - \(color)")
        }
    }
    
    class Circle: Shape {
        func draw(color: String) {
            print("Рисуем круг с цветом - \(color)")
        }
    }

    class Board: Shape {
        lazy var shapes = [Shape]()
        
        init(_ shapes: Shape...) {
            self.shapes = shapes
        }
        
        func draw(color: String) {
            for shape in shapes {
                shape.draw(color: color)
            }
        }
    }

    /*
    
    Usage
 
    let board = Board(Circle(), Square(), Circle())
    board.draw(color: "Black")
    */
}
