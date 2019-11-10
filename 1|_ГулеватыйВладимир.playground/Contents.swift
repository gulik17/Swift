import UIKit

/*
 * Квадратное уравнение, это уравнение вида ax​2+bx+c=0,
 *   где x – неизвестное,
 *   a, b, c – некоторые числа, причем a≠0.
 * a и b называют коэффициентами квадратного уравнения, а c – свободным членом.
 */

let a = 1;
let b = 2;
let c = -3;
 
if (a == 0) {
    print("Не является квадратным уравнением");
} else {
    var d = b * b - 4 * a * c;
    if ( d < 0 ) {
        print("Решений нет, поскольку D < 0");
    } else {
        d = Int(sqrt(Double(d)));
        let x1 = ((-b) + d) / (2 * a);
        let x2 = ((-b) - d) / (2 * a);
        print("x1 = ", x1, "; x2 = ", x2);
    }
}



var k1:Double = 7.0,
    k2:Double = 8.0,
    g:Double,
    Perimeter:Double,
    Square:Double;

g = sqrt(k1*k1 + k2*k2)         // Длина гипотенузы
Perimeter = k1 + k2 + g         // Вычисление периметра
Square = (k1 * k2) / 2;         // Вычисление площади
print("Периметр треугольника ", Perimeter)
print("Площадь треугольника ", Square)

var deposit:Double = 10000,
    percent:Double = 10,
    total:Double;

for years in 1...5 {
    deposit = deposit + (deposit * percent/100)
    print("Сумма вклада на конец \(years) года составит \(deposit)")
}


