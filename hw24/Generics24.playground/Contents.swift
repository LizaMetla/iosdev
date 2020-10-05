//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

protocol Shoot {
    func shoot()
}

class Solder<T>{
    //name
    //завние
    //подключить протокол стрелять
    var name: String
    var rank: String
    
    init(name: String, rank: String) {
        self.name = name
        self.rank = rank
    }

    //класс с шаблоном
    //вызвать метод протокола
    //метод называет имя звание
}

extension Solder  {
    var solderLife: Int
    {
        if solderLife > 10 {
            print("А вот и дембель!")
        } else {
            print("Пусть чистит картошку")
        }
        return
    }
    
}


