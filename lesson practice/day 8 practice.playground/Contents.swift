import UIKit

var greeting = "Hello, playground"






func isOdd(_ number: Int) -> Bool{
    !number.isMultiple(of: 2)
}

print(isOdd(3))

func addNums(_ num1: Double, _ num2: Double) -> Double{
    num1 + num2
}

print(addNums(3.3, 7.93))
