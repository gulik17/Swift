import UIKit

// 1. Написать функцию, которая определяет, четное число или нет.
func checkEven(_ num: Int) -> Bool {
    return (num % 2 == 0) ? true : false
}

// 2. Написать функцию, которая определяет, делится ли число без остатка на 3.
func divisionByThree(_ num: Int) -> Bool {
    return (num % 3 == 0) ? true : false
}

// 3. Создать возрастающий массив из 100 чисел.
var arr = [Int]()
for i in 1...100 {
    arr.append(i)
}
print("Массив из 100 чисел:\n\(arr)")

//4. Удалить из этого массива все четные числа и все числа, которые не делятся на 3.
var i:Int = 0
while i < arr.count {
    if checkEven(arr[i]) {
        arr.remove(at: i)
    } else {
        if !divisionByThree(arr[i]) {
            arr.remove(at: i)
        } else {
            i += 1
        }
    }
}
print("Убрали из массива все четные числа и все числа, которые не деляться на 3:\n\(arr)")

//5. * Написать функцию, которая добавляет в массив новое число Фибоначчи, и добавить при помощи нее 100 элементов.
// 100 элементов добавить не возможно т.к число выходит за рамки Int (как я понял)
var fibArr = [0,1]
func appFibToArr() {
    fibArr.append(fibArr[fibArr.count - 1] + fibArr[fibArr.count - 2])
}

for _ in 1...90 {
    appFibToArr()
}

print("Числа Фибоначчи:\n\(fibArr)")

//6. * Заполнить массив из 100 элементов различными простыми числами. Натуральное число, большее единицы, называется простым, если оно делится только на себя и на единицу.
func isPrime(_ num:Int) -> Bool {
    if (num == 2) {
        return true
    }
    if (num % 2 == 0) {
        return false
    }
    var i = 3
    let max = Int(sqrt(Double(num)))
    while (i <= max) {
        if (num % i == 0) {
            return false
        }
        i += 2
    }
    return true
}

var primes = [Int]();
var arrLength = 2
while (primes.count < 100) {
    if (isPrime(arrLength)) {
        primes.append(arrLength)
    }
    arrLength += 1
}
print("Массив из 100 простых чисел:\n\(primes)")
