//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

protocol Shoot {
    func shoot()
}

class Solder<T> : Shoot{
    func shoot() {
        print("Пиу-пиу " + name + ", " + rank + "\n")
    }

    var name: String
    var rank: String
    var solderLife: Int
    
    init(name: String, rank: String, solderLife: Int) {
        self.name = name
        self.rank = rank
        self.solderLife = solderLife
    }

}

extension Solder  {
    func checkSolderlife() {
        if solderLife > 10 {
            print("А вот и дембель!")
        } else {
            print("Пусть чистит картошку")
        }
    }
}

let solder = Solder<Any>(name: "Sasha", rank: "Solder", solderLife: 5)
solder.checkSolderlife()
solder.shoot()


var solders = [Solder<Int>]()
solders.append(Solder(name: "Sasha", rank: "Solder", solderLife: 5))
solders.append(Solder(name: "Denis", rank: "Solder", solderLife: 3))
solders.append(Solder(name: "Maxim", rank: "Oficer", solderLife: 25))

var sortSolders = solders.sorted(by: { $0.solderLife > $1.solderLife })


print("\nОтсортированные солдаты \n")

for solder in sortSolders {
    print(solder.name, solder.rank, solder.solderLife)
}

print("\nУдаление военослужащего с самым большим сроком службы \n")
sortSolders.remove(at: 0)

for solder in sortSolders {
    print(solder.name, solder.solderLife)
}




