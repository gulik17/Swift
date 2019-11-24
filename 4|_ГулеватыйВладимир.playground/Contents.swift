import UIKit

//1. Описать класс Car c общими свойствами автомобилей и пустым методом действия по аналогии с прошлым заданием.
//2. Описать пару его наследников trunkCar и sportСar. Подумать, какими отличительными свойствами обладают эти автомобили. Описать в каждом наследнике специфичные для него свойства.
//3. Взять из прошлого урока enum с действиями над автомобилем. Подумать, какие особенные действия имеет trunkCar, а какие – sportCar. Добавить эти действия в перечисление.
//4. В каждом подклассе переопределить метод действия с автомобилем в соответствии с его классом.
//5. Создать несколько объектов каждого класса. Применить к ним различные действия.
//6. Вывести значения свойств экземпляров в консоль.


// класс машины
class Car {
    enum Actions {
        case engineOn
        case engineOff
        case windowsOpen
        case windowsClose
        case cargoLoad(Double)
    }

    let brand: String
    let color: String
    let issue: UInt
    var trunkSize = [Double]() // объем багажника в виде массива [x,y] x - сколько груза, y - сколько влазиет
    var engine: Bool
    var windows: Bool

    func description() {
        print("марка - \(brand)\nгод выпуска - \(issue)\nобъём багажника/кузова - \(trunkSize[1]) кг\nдвигатель - \(engine ? "запущен" : "заглушен")\nокна - \(windows ? "открыты" : "закрыты")\n")
    }

    init(brand: String, color: String, issue: UInt, trunkSize: [Double]) {
        self.brand = brand
        self.color = color
        self.issue = issue
        self.trunkSize = trunkSize
        self.engine = true
        self.windows = true
    }

    func action(_ action: Actions) { // функция будет переопределена, так что реализовавать ее не будем
        switch action {
        case .engineOn:
            print("Завели двигатель")
        case .engineOff:
            print("Заглушили двигатель")
        case .windowsOpen:
            print("Открыли окна")
        case .windowsClose:
            print("Закрыли окна")
        case .cargoLoad(let load):
            print("Загрузили/выгрузили \(load)")
        }
    }
}

class Passenger: Car {
    enum roofAction {
        case roofOpen,
            roofClose
    }
    var roof: Bool

    override init(brand: String, color: String, issue: UInt, trunkSize: [Double]) {
        self.roof = false
        super.init(brand: brand, color: color, issue: issue, trunkSize: trunkSize)
        self.engine = true
        self.windows = true
    }
    
    func roofAction(_ action: roofAction) {
        switch action {
        case .roofOpen:
            if !roof {
                roof = true
                print("крышу подняли \(brand)")
            } else {
                print("крыша уже поднята")
            }
        case .roofClose:
            if roof {
                roof = false
                print("крышу закрыли \(brand)")
            } else {
                print("крыша уже закрыта")
            }
        }
    }
    
    override func description() {
        print("марка - \(brand)\nгод выпуска - \(issue)\nобъём багажника - \(trunkSize[1]) кг\nдвигатель - \(engine ? "запущен" : "заглушен")\nокна - \(windows ? "открыты" : "закрыты")\nкрыша - \(roof ? "поднята" : "опущена")\n")
    }
    
    override func action(_ action: Actions) {
        switch action {
        case .engineOn:
            if !engine {
                engine = true
                print("запустили двигатель \(brand)")
            } else {
                print("двигатель уже запущен")
            }
        case .engineOff:
            if engine {
                engine = false
                print("заглушили двигатель \(brand)")
            } else {
                print("двигатель уже заглушен")
            }
        case .windowsOpen:
            if !windows {
                windows = true
                print("открыли окна \(brand)")
            } else {
                print("окна уже открыты")
            }
        case .windowsClose:
            if windows {
                windows = false
                print("закрыли окна \(brand)")
            } else {
                print("окна уже закрыты")
            }
        case .cargoLoad(let load):
            let sizeLoad = trunkSize[0] + load
            switch sizeLoad {
            case _ where sizeLoad > trunkSize[1]:
                trunkSize[0] = trunkSize[1]
                print("багажник полон\nв багажнике - \(trunkSize[0]) кг\n")
            case _ where sizeLoad < 0:
                trunkSize[0] = 0
                print("багажник пуст\nОбъем багажника - \(trunkSize[1]) кг\n")
            default:
                trunkSize[0] += load
                if (load > 0) {
                    print("загрузили в \(brand) \(load) кг груза\nвсего в багажнике - \(trunkSize[0]) кг из \(trunkSize[1]) разрешенных\n")
                } else {
                   print("выгрузили из \(brand) \(load * -1) кг груза\nвсего в багажнике - \(trunkSize[0]) кг из \(trunkSize[1]) разрешенных\n")
               }
            }
        }
    }
    
}

class Truck: Car {
    enum cargoAction {
        case cargoOpen,
            cargoClose
    }
    var cargo: Bool

    override init(brand: String, color: String, issue: UInt, trunkSize: [Double]) {
        self.cargo = false
        super.init(brand: brand, color: color, issue: issue, trunkSize: trunkSize)
        self.engine = true
        self.windows = true
    }
    
    func cargoAction(_ action: cargoAction) {
        switch action {
        case .cargoOpen:
            if !cargo {
                cargo = true
                print("кузов подняли \(brand)")
            } else {
                print("кузов уже поднят")
            }
        case .cargoClose:
            if cargo {
                cargo = false
                print("кузов опущен \(brand)")
            } else {
                print("кузов уже опущен")
            }
        }
    }
    
    override func description() {
        print("марка - \(brand)\nгод выпуска - \(issue)\nобъём кузова - \(trunkSize[1]) кг\nдвигатель - \(engine ? "запущен" : "заглушен")\nокна - \(windows ? "открыты" : "закрыты")\nкузов - \(cargo ? "поднят" : "опущен")\n")
    }
    
    override func action(_ action: Actions) {
        switch action {
        case .engineOn:
            if !engine {
                engine = true
                print("запустили двигатель \(brand)")
            } else {
                print("двигатель уже запущен")
            }
        case .engineOff:
            if engine {
                engine = false
                print("заглушили двигатель \(brand)")
            } else {
                print("двигатель уже заглушен")
            }
        case .windowsOpen:
            if !windows {
                windows = true
                print("открыли окна \(brand)")
            } else {
                print("окна уже открыты")
            }
        case .windowsClose:
            if windows {
                windows = false
                print("закрыли окна \(brand)")
            } else {
                print("окна уже закрыты")
            }
        case .cargoLoad(let load):
            let sizeLoad = trunkSize[0] + load
            switch sizeLoad {
            case _ where sizeLoad > trunkSize[1]:
                trunkSize[0] = trunkSize[1]
                print("кузов полон\nв кузове - \(trunkSize[0]) кг\n")
            case _ where sizeLoad < 0:
                trunkSize[0] = 0
                print("кузов пуст\nОбъем кузова - \(trunkSize[1]) кг\n")
            default:
                trunkSize[0] += load
                if (load > 0) {
                    print("загрузили в \(brand) \(load) кг груза\nвсего в кузове - \(trunkSize[0]) кг из \(trunkSize[1]) разрешенных\n")
                } else {
                    print("выгрузили из \(brand) \(load * -1) кг груза\nвсего в кузове - \(trunkSize[0]) кг из \(trunkSize[1]) разрешенных\n")
                }
            }
        }
    }
}

var Opel = Passenger(brand: "Opel", color: "Серый", issue: 2005, trunkSize: [0,500])
var Kamaz = Truck(brand: "КАМАЗ", color: "Белый", issue: 2000, trunkSize: [0,10000])

Opel.description()
Kamaz.description()

Opel.action(.cargoLoad(100))
Opel.action(.cargoLoad(-100))
Opel.action(.engineOn)
Opel.action(.engineOff)
Opel.action(.engineOff)
Opel.action(.windowsOpen)
Opel.roofAction(.roofOpen)
Opel.description()

Kamaz.action(.cargoLoad(100))
Kamaz.action(.cargoLoad(100))
Kamaz.action(.cargoLoad(-100))
Kamaz.action(.cargoLoad(100))
Kamaz.action(.cargoLoad(100))
Kamaz.action(.engineOff)
Kamaz.action(.windowsClose)
Kamaz.action(.windowsClose)
Kamaz.cargoAction(.cargoOpen)
Kamaz.description()
