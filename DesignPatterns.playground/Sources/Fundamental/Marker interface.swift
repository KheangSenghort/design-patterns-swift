import Foundation

protocol Marker {
}

class BoxOne: Marker {
    // применяется маркер
}

class BoxTwo {
    // не применяется маркер
}


/*
 
 Usage
 
let boxes: [Any] = [BoxOne(), BoxTwo()]

for box in boxes {
    if (box is Marker) {
        // объект применяет маркер
    } else {
        // объект не применяет маркер
    }
}
 */
