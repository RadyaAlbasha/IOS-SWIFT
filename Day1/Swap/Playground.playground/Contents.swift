import Foundation

func swap(_ a: inout Int, _ b: inout Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}
var someInt = 1
var anotherInt = 15
swap(&someInt, &anotherInt)
print("someInt is now" ,someInt, "and anotherInt is now ",anotherInt)