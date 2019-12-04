import UIKit

/*
 1. Создать протокол «Car» и описать свойства, общие для автомобилей, а также метод действия.
 2. Создать расширения для протокола «Car» и реализовать в них методы конкретных действий с автомобилем: открыть/закрыть окно, запустить/заглушить двигатель и т.д. (по одному методу на действие, реализовывать следует только те действия, реализация которых общая для всех автомобилей).
 3. Создать два класса, имплементирующих протокол «Car» - trunkCar и sportСar. Описать в них свойства, отличающиеся для спортивного автомобиля и цистерны.
 4. Для каждого класса написать расширение, имплементирующее протокол CustomStringConvertible.
 5. Создать несколько объектов каждого класса. Применить к ним различные действия.
 6. Вывести сами объекты в консоль. */

protocol CarProtocol {
    var brand: String {get}
    var color: String {get}
    var issue: UInt {get}

    func engineStart() -> String
    func engineStop() -> String
    func windowsOpen() -> String
    func windowsClose() -> String
}

extension CarProtocol {
    func engineStart() -> String {
        return "Start"
    }
    func engineStop() -> String {
        return "Stop"
    }
    func windowsOpen() -> String {
        return "Open"
    }
    func windowsClose() -> String {
        return "Close"
    }
}

// класс машины
class trunkCar: CarProtocol {
    enum truck: String {
        case Open, Close
    }

    var brand: String
    var color: String
    var issue: UInt
    var trunkVol: Int
    var doorStatus: String
    var truckStatus: truck = .Close
    
    init(brand: String, color: String, issue: UInt, trunkVol: Int, doorStatus: String, truckStatus: truck) {
        self.brand = brand
        self.color = color
        self.issue = issue
        self.trunkVol = trunkVol
        self.doorStatus = doorStatus
        self.truckStatus = truckStatus
    }
    
    func openCargo() {
        truckStatus = .Open
    }
    func closeCargo() {
        truckStatus = .Close
    }
}

class sportCar: CarProtocol {
    enum roof: String {
        case Open, Close
    }

    var brand: String
    var color: String
    var issue: UInt
    var trunkVol: Int
    var doorStatus: String
    var roofStatus: roof = .Close
    
    init(brand: String, color: String, issue: UInt, trunkVol: Int, doorStatus: String, roofStatus: roof) {
        self.brand = brand
        self.color = color
        self.issue = issue
        self.trunkVol = trunkVol
        self.doorStatus = doorStatus
        self.roofStatus = roofStatus
    }
    
    func openRoof() {
        roofStatus = .Open
    }
    func closeRoof() {
        roofStatus = .Close
    }

}

extension trunkCar: CustomStringConvertible {
    var description: String{
        return "Машина - \(brand) \nцвет - \(color) \n\(issue) года выпуска \nобъемом кузова - \(trunkVol)\nкузов - \(truckStatus)\n"
    }
}

extension sportCar: CustomStringConvertible {
    var description: String{
        return "Машина - \(brand) \nцвет - \(color) \n\(issue) года выпуска \nобъемом багажника - \(trunkVol)\nкрыша - \(roofStatus)\n"
    }
}

var opel = sportCar(brand: "Opel", color: "Серый", issue: 2005, trunkVol: 500, doorStatus: "Closed", roofStatus: .Close)
var kamaz = trunkCar(brand: "Kamaz", color: "Красный", issue: 1985, trunkVol: 10000, doorStatus: "Closed", truckStatus: .Close)

opel.roofStatus = .Open
print(opel)
kamaz.truckStatus = .Open
print(kamaz)
var opelEngine = opel.engineStart()
print("Двигатель \(opel.brand) - \(opelEngine)")
