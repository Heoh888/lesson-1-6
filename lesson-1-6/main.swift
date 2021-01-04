//1. Реализовать свой тип коллекции «очередь» (queue) c использованием дженериков.
//
//2. Добавить ему несколько методов высшего порядка, полезных для этой коллекции (пример: filter для массивов)
//
//3. * Добавить свой subscript, который будет возвращать nil в случае обращения к несуществующему индексу.

import Foundation

protocol Distribution {
    func timeLimit() -> Int
}

class Parking: Distribution {
    var carNumber: String = generatingCarNumber()
    var paidForParking: Int
    var parkingSpace = Int.random(in: 0..<100)
    
    init(paidForParking: Int) {
        self.paidForParking = paidForParking
    }
    
    func timeLimit() -> Int {
        return paidForParking / 100
    }
}
extension Parking: CustomStringConvertible {
     var description: String {
         return "Автомобиль \(carNumber) занял парковку №\(parkingSpace) оплачено \(timeLimit()) часа"
     }
 }

class Arena: Distribution {
    var nameCharacter: String
    var arenaNumber = Int.random(in: 1..<10)
    
    init(nameCharacter: String) {
        self.nameCharacter = nameCharacter
    }
    
    func timeLimit() -> Int {
        let status: Int = 0
        return status
    }
}

extension Arena: CustomStringConvertible {
     var description: String {
         return "Персонаж \(nameCharacter) занял арену №\(arenaNumber)"
     }
 }

struct Queue<T> {
    private var elemments: [T] = []
    
    mutating func push(_ elemment: T) {
        elemments.append(elemment)
    }
    
    mutating func pop() -> T {
        return elemments.remove(at: 0)
    }
}

extension Queue: CustomStringConvertible {
     var description: String {
        return elemments.isEmpty ? "Очередь пуста" : "Очередь: \(elemments)"
     }
 }

extension Queue {
    
    func filter() {
        
    }
    
 }

var parkingCar = Queue<Parking>()
var сharacterArena = Queue<Arena>()

сharacterArena.push(Arena(nameCharacter: "Konnon"))
сharacterArena.push(Arena(nameCharacter: "Ragnar"))
сharacterArena.push(Arena(nameCharacter: "Anny"))
print(сharacterArena)

let elementCharacter1 = сharacterArena.pop()
print(сharacterArena)

parkingCar.push(Parking(paidForParking: 100))
parkingCar.push(Parking(paidForParking: 200))
parkingCar.push(Parking(paidForParking: 300))
print(parkingCar)

let elementCar1 = parkingCar.pop()
let elementCar2 = parkingCar.pop()
let elementCar3 = parkingCar.pop()
print(parkingCar)


//print(randonNumber())

