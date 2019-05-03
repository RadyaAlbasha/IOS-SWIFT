import Foundation

func getFactorial (num: Int) -> Int{//(Int)->Int
    var fact:Int = 1
    for item in 1...num
    {
        fact = fact*item
    }
    return fact
}
var testNum:Int = 5
print("Factorial",testNum,"=",getFactorial(num: testNum))