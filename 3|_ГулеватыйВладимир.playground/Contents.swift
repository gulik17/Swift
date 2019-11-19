import UIKit

//1. Описать несколько структур – любой легковой автомобиль и любой грузовик.
//2. Структуры должны содержать марку авто, год выпуска, объем багажника/кузова, запущен ли двигатель, открыты ли окна, заполненный объем багажника.
//3. Описать перечисление с возможными действиями с автомобилем: запустить/заглушить двигатель, открыть/закрыть окна, погрузить/выгрузить из кузова/багажника груз определенного объема.
//4. Добавить в структуры метод с одним аргументом типа перечисления, который будет менять свойства структуры в зависимости от действия.
//5. Инициализировать несколько экземпляров структур. Применить к ним различные действия.
//6. Вывести значения свойств экземпляров в консоль.

enum Actions {
    case engineOn
    case engineOff
    case windowsOpen
    case windowsClose
    case cargoAdd
    case cargoRem
}

// Структура легковой машины
struct Car {
    var brand: String
    var issue: UInt
    var trunkSize = [UInt]() // объем багажника в виде массива [x,y] x - сколько груза, y - сколько влазиет
    var engine: Bool
    var windows: Bool

    func description() {
        print("марка - \(brand)\nгод выпуска - \(issue)\nобъём багажника - \(trunkSize[1]) кг\nдвигатель - \(engine ? "запущен" : "заглушен")\nокна - \(windows ? "открыты" : "закрыты")\n")
    }

    init(brand: String, issue: UInt, trunkSize: [UInt]) {
        self.brand = brand
        self.issue = issue
        self.trunkSize = trunkSize
        self.engine = true
        self.windows = true
    }
    
    init() {
        brand = "Opel Astra H"
        issue = 2005
        trunkSize = [0,500]
        engine = false
        windows = false
    }

    mutating func action(_ action: Actions) {
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
        case .cargoRem:
            if trunkSize[0] == 0 {
                print("багажник пуст\nОбъем багажника - \(trunkSize[1]) кг\n")
            } else {
                trunkSize[0] -= (trunkSize[1]/100*25)
                print("выгрузили из \(brand) \(trunkSize[1]/100*25) кг груза\nв багажнике осталось - \(trunkSize[0]) кг из \(trunkSize[1]) разрешенных\n")
            }
        case .cargoAdd:
            if trunkSize[0] == trunkSize[1] {
                print("багажник полон\nв багажнике - \(trunkSize[0]) кг\n")
            } else {
                trunkSize[0] += (trunkSize[1]/100*25)
                print("загрузили в \(brand) \(trunkSize[1]/100*25) кг груза\nвсего в багажнике - \(trunkSize[0]) кг из \(trunkSize[1]) разрешенных\n")
            }
        }
    }
}

struct Truck {
    var brand: String
    var issue: UInt
    var trunkSize = [UInt]() // объем багажника в виде массива [x,y] x - сколько груза, y - сколько влазиет
    var engine: Bool
    var windows: Bool

    func description() {
        print("марка - \(brand)\nгод выпуска - \(issue)\nобъём кузова - \(trunkSize[1]) кг\nдвигатель - \(engine ? "запущен" : "заглушен")\nокна - \(windows ? "открыты" : "закрыты")\n")
    }

    init(brand: String, issue: UInt, trunkSize: [UInt]) {
        self.brand = brand
        self.issue = issue
        self.trunkSize = trunkSize
        self.engine = true
        self.windows = true
    }
    
    init() {
        brand = "КамАЗ-5320"
        issue = 1985
        trunkSize = [0,10000]
        engine = false
        windows = false
    }

    mutating func action(_ action: Actions) {
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
        case .cargoRem:
            if trunkSize[0] == 0 {
                print("кузов пуст\nОбъем кузова - \(trunkSize[1]) кг\n")
            } else {
                trunkSize[0] -= (trunkSize[1]/100*25)
                print("выгрузили из \(brand) \(trunkSize[1]/100*25) кг груза\nв кузове осталось - \(trunkSize[0]) кг из \(trunkSize[1]) разрешенных\n")
            }
        case .cargoAdd:
            if trunkSize[0] == trunkSize[1] {
                print("кузов полон\nв кузове - \(trunkSize[0]) кг\n")
            } else {
                trunkSize[0] += (trunkSize[1]/100*25)
                print("загрузили в \(brand) \(trunkSize[1]/100*25) кг груза\nвсего в кузове - \(trunkSize[0]) кг из \(trunkSize[1]) разрешенных\n")
            }
        }
    }
}

var Opel = Car()
var Kamaz = Truck()

Opel.description()
Kamaz.description()

Opel.action(.cargoAdd)
Opel.action(.engineOn)
Opel.action(.engineOff)
Opel.action(.engineOff)
Opel.action(.windowsOpen)
Opel.description()

Kamaz.action(.cargoAdd)
Kamaz.action(.cargoAdd)
Kamaz.action(.cargoAdd)
Kamaz.action(.cargoAdd)
Kamaz.action(.cargoAdd)
Kamaz.action(.engineOff)
Kamaz.action(.windowsClose)
Kamaz.action(.windowsClose)
Kamaz.description()
