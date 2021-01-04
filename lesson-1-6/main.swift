//1. Реализовать свой тип коллекции «очередь» (queue) c использованием дженериков.
//
//2. Добавить ему несколько методов высшего порядка, полезных для этой коллекции (пример: filter для массивов)
//
//3. * Добавить свой subscript, который будет возвращать nil в случае обращения к несуществующему индексу.

import Foundation


// Парковка для автомобилей
class Parking: CustomStringConvertible {
    var carNumber: String = generatingCarNumber() // генерирует случайный номер автомобиля
    var paidForParking: Int
    var parkingSpace = Int.random(in: 0..<100)
    
    init(paidForParking: Int) {
        self.paidForParking = paidForParking
    }
    // определяет на сколько оплачена парковка
    func timeLimit() -> Int {
        return paidForParking / 100
    }
    var description: String {
        return "Автомобиль \(carNumber) занял парковку №\(parkingSpace) оплачено \(timeLimit()) часа"
    }
}

// Арена для персонажей
class Arena: CustomStringConvertible {
    var nameCharacter: String
    var arenaNumber = Int.random(in: 1..<10)
    
    init(nameCharacter: String) {
        self.nameCharacter = nameCharacter
    }
    var description: String {
        return "Персонаж \(nameCharacter) занял арену №\(arenaNumber)"
    }
}

// коллекция «очередь» для классов Arena и Parking
struct Queue<T> {
    private var elemments: [T] = []
    
    mutating func push(_ elemment: T) {
        elemments.append(elemment)
    }
    
    mutating func pop() -> T {
        return elemments.remove(at: 0)
    }
}
// расширение для коллекции (Queue: CustomStringConvertible)
extension Queue: CustomStringConvertible {
     var description: String {
        return elemments.isEmpty ? "Очередь пуста" : "Очередь: \(elemments)"
     }
 }


var parkingCar = Queue<Parking>()
var сharacterArena = Queue<Arena>()

//сharacterArena.push(Arena(nameCharacter: "Konnon"))
//сharacterArena.push(Arena(nameCharacter: "Ragnar"))
//сharacterArena.push(Arena(nameCharacter: "Anny"))
//print(сharacterArena)
//
//let elementCharacter1 = сharacterArena.pop()
//print(сharacterArena)

parkingCar.push(Parking(paidForParking: 100))
parkingCar.push(Parking(paidForParking: 200))
parkingCar.push(Parking(paidForParking: 300))
print(parkingCar)

let elementCar1 = parkingCar.pop()
let elementCar2 = parkingCar.pop()
let elementCar3 = parkingCar.pop()
print(parkingCar)



//print(randonNumber())

