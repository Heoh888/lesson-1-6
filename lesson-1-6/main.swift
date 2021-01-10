
import Foundation


// Парковка для автомобилей
class Parking: CustomStringConvertible {
    let carNumber: String = generatingCarNumber() // генерирует случайный номер автомобиля
    let paidForParking: Int
    let parkingSpace = Int.random(in: 1..<100)
    
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
    let nameCharacter: String
    let lavel: Int
    let arenaNumber = Int.random(in: 1..<10)
    
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
    
    mutating func pop() -> T? {
        return elemments.isEmpty ? .none : elemments.remove(at: 0)
    }

    subscript(index: Int) -> T{
        return elemments[index]
    }
}
// расширение для коллекции (Queue: CustomStringConvertible)
extension Queue: CustomStringConvertible {
     var description: String {
        return elemments.isEmpty ? "Очередь пуста" : "Очередь: \(elemments)"
     }
    
    func filter(criterion:(T) -> Bool) -> [T] {
        var result = [T]()
        
        for i in elemments {
            if criterion(i) {
                result.append(i)
            }
        }
        return result
    }
 }

//------------------------------ Парковка
var parkingCar = Queue<Parking>()

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

print(parkingCar[1])

let elemmentCar1 = parkingCar.pop()
let elemmentCar2 = parkingCar.pop()
let elemmentCar3 = parkingCar.pop()
print(parkingCar)

let paidParkingFilter = parkingCar.filter(criterion: { $0.paidForParking == 100 })
let parkingSpaceFilter = parkingCar.filter(criterion: { $0.parkingSpace == 20 })
print(paidParkingFilter)

//------------------------------ Арена
var сharacterArena = Queue<Arena>()

сharacterArena.push(Arena(nameCharacter: "Konnon", lavel: 76))
сharacterArena.push(Arena(nameCharacter: "Ragnar", lavel: 45))
сharacterArena.push(Arena(nameCharacter: "Anny", lavel: 90))
сharacterArena.push(Arena(nameCharacter: "Viking", lavel: 11))
сharacterArena.push(Arena(nameCharacter: "Salam", lavel: 23))
сharacterArena.push(Arena(nameCharacter: "Krot", lavel: 55))
сharacterArena.push(Arena(nameCharacter: "VinDizel", lavel: 37))
сharacterArena.push(Arena(nameCharacter: "Neo", lavel: 73))
сharacterArena.push(Arena(nameCharacter: "Gendalf", lavel: 13))
print(сharacterArena)

print(сharacterArena[1])

let elemmentCharacter1 = сharacterArena.pop()
let elemmentCharacter2 = сharacterArena.pop()
let elemmentCharacter3 = сharacterArena.pop()
print(сharacterArena)

let lavelFilter = сharacterArena.filter(criterion: { $0.lavel < 50 })
let arenaFilter = сharacterArena.filter(criterion: { $0.arenaNumber == 3 })
print(lavelFilter)
print(arenaFilter)



