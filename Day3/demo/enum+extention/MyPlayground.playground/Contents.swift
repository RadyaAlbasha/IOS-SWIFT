import UIKit

var str = "Hello, playground"
"enum + extention"
enum  EnumA: String{
    case case1  = "xyz", case2 , case3
}
var obj = EnumA.case1.rawValue
//obj = .case2
print(obj)

//extention
extension String{
    func sayHi(){
        print("Hi")
    }
}
var x : String = "Radya"
x.sayHi()
