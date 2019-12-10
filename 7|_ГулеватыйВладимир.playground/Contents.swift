import UIKit

// 1. Придумать класс, методы которого могут создавать непоправимые ошибки. Реализовать их с помощью try/catch.
// 2. Придумать класс, методы которого могут завершаться неудачей. Реализовать их с использованием Error.

enum GroupError: Error {
    case notFound
}

struct User: CustomStringConvertible {
    let name: String
    let surname: String
    let age: Int

    public var description: String {
        return "Пользователь \(surname) \(name) Возраст \(age)"
    }
}

class GroupOfUsers {
    // пользователи
    var users = [
        1: User(name: "Иван",  surname: "Иванов",  age: 34),
        2: User(name: "Петр",  surname: "Петров",  age: 30),
        3: User(name: "Сидор", surname: "Сидоров", age: 28),
        4: User(name: "Вася",  surname: "Пупкин",  age: 20)
    ]

    func getInfo(_ user: Int) throws -> User {
        guard let man = users[user] else {
            throw GroupError.notFound
        }
        return man
    }
}

let users = GroupOfUsers()
var i = 1
while i < 10 {
    do {
        let user = try users.getInfo(i)
        print("\(i) - \(user.description)")
    } catch GroupError.notFound {
        print("\(i) - Пользователь не найден")
    }
    i += 1
}
