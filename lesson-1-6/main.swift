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
    var lavel: Int
    var arenaNumber = Int.random(in: 1..<10)
    
    init(nameCharacter: String, lavel: Int) {
        self.nameCharacter = nameCharacter
        self.lavel = lavel
    }
    var description: String {
        return "Персонаж \(nameCharacter) с уровнем \(lavel) занял арену №\(arenaNumber)"
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
    
    func myFilter(predicate:(T) -> Bool) -> [T] {
        var result = [T]()
        
        for i in elemments {
            if predicate(i) {
                result.append(i)
            }
        }
        return result
    }
 }


var parkingCar = Queue<Parking>()
var сharacterArena = Queue<Arena>()

сharacterArena.push(Arena(nameCharacter: "Konnon", lavel: 76))
сharacterArena.push(Arena(nameCharacter: "Ragnar", lavel: 76))
сharacterArena.push(Arena(nameCharacter: "Anny", lavel: 76))
сharacterArena.push(Arena(nameCharacter: "Viking", lavel: 76))
сharacterArena.push(Arena(nameCharacter: "Salam", lavel: 76))
сharacterArena.push(Arena(nameCharacter: "Krot", lavel: 76))
сharacterArena.push(Arena(nameCharacter: "VinDizel", lavel: 76))
сharacterArena.push(Arena(nameCharacter: "Neo", lavel: 76))
сharacterArena.push(Arena(nameCharacter: "Gendalf", lavel: 76))
print(сharacterArena)

let elemmentCharacter1 = сharacterArena.pop()
print(сharacterArena)


let honoursPupil = сharacterArena.myFilter(predicate: {$0.arenaNumber == 3})
print(honoursPupil)

parkingCar.push(Parking(paidForParking: 100))
parkingCar.push(Parking(paidForParking: 200))
parkingCar.push(Parking(paidForParking: 300))
parkingCar.push(Parking(paidForParking: 100))
parkingCar.push(Parking(paidForParking: 100))
parkingCar.push(Parking(paidForParking: 300))
parkingCar.push(Parking(paidForParking: 100))
parkingCar.push(Parking(paidForParking: 100))
parkingCar.push(Parking(paidForParking: 300))
print(parkingCar)

let elemmentCar1 = parkingCar.pop()
let elemmentCar2 = parkingCar.pop()
let elemmentCar3 = parkingCar.pop()
print(parkingCar)

let honoursPupil1 = parkingCar.myFilter(predicate: {$0.paidForParking == 100})
print(honoursPupil1)


