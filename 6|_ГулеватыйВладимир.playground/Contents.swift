import UIKit

/**
 * Практическое задание 6
 *
 * 1. Реализовать свой тип коллекции «очередь» (queue) c использованием дженериков.
 * 2. Добавить ему несколько методов высшего порядка, полезных для этой коллекции (пример: filter для массивов)
 * 3. Добавить свой subscript, который будет возвращать nil в случае обращения к несуществующему индексу.
 */

struct queue<T> {
    var array: [T] = []

    mutating func push(_ item: T) {
        array.append(item)
    }

    mutating func pop() -> T? {
        return array.removeLast()
    }

    mutating func filter(order: (T) -> Bool ) -> [T] {
        var temp = [T]()
        for item in array {
            if order(item) {
                temp.append(item)
            }
        }
        return temp
    }

    subscript(idx: Int) -> T? {
        return (idx < self.array.count) ? array[idx] : nil
    }
}

let odd: (Int) -> Bool = { (val: Int) -> Bool in
    return val % 2 == 0
}

let even: (Int) -> Bool = { (val: Int) -> Bool in
    return val % 2 != 0
}

var queue_int = queue<Int>()
queue_int.push(1)
queue_int.push(2)
queue_int.push(3)
queue_int.push(4)
queue_int.push(5)
print(queue_int)
print("\(String(describing: queue_int[55])) - обращаемся к несуществующему элементу массива")

var queue_odd = queue_int.filter(order: odd)
print(queue_odd)
var queue_even = queue_int.filter(order: even)
print(queue_even)
queue_int.pop()
print("\(String(describing: queue_int[5])) - проверяем удаленный элементу массива")
