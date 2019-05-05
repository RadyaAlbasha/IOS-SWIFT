import UIKit

var str = "Hello, playground"
//Closures
//method is special case of closures
var strArr = ["Radya","Esraa","Nouran","Sahar","Ahmed"]
//strArr.sort { (s1 : String, s2 : String) -> Bool in
//    return s1 < s2
//}
///////////////////////////////////////////////////////
//strArr.sort { s1, s2 in s1 < s2}

strArr.sort { $0 < $1}

print(strArr)
/////////protocol//////////
protocol extra{
    func method2()
}
protocol myProtocol : extra{
    var firstName : String {get} // constent
    var lastName : String {get set} // stored property
    var fullName : String {get set} // computed property
    var id : Int {get} // can be read-Write
    
    func instanceMethod()-> String
    static func myStaticMethod()
}

struct MyStruct :  myProtocol{
    
    let firstName: String = "Radya"
    
    var lastName: String = "Albasha"
    
    var fullName: String{
        get{
            return firstName + lastName
        }set{
            print("setted")
        }
    }
    
    var id: Int{
        get{
            return 30
        }set{
            print("setted")
        }
    }
    
    func instanceMethod() -> String {
        return "instanceMethod"
    }
    
    static func myStaticMethod(){
        print("static")
    }
    
    func method2() {
         print("extra method2")
    }
}
var objS = MyStruct()
print(objS.instanceMethod())
MyStruct.myStaticMethod()

