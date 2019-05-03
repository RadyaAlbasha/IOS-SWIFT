import UIKit

var str = "Hello, playground"

//let x:uint = -1 //compile time error

//let y: Int8.max +1 //compile time error

let httpstatuse = (404,"Not Found")

print(httpstatuse.0)
print(httpstatuse.1)
//print(httpstatuse.2)//compile time error

let httpstatuse2 = (code: 200, msg: "OK")

print(httpstatuse2.code)
print(httpstatuse2.msg)

//var myOptional : Int? = 5
var myOptional : Int?
myOptional = 5
//print(myOptional)
let myValue2 = myOptional!
print(myValue2)
//safe unwrapping
if let myValue = myOptional{
    print(myValue)
}else{
    print("Cannot Unrwap")
}
//forced unwrapping
print(myOptional!)

//implicitly unwrapped
var myImplicit: Int! = 7
var myImplicit2: Int = myImplicit
print(myImplicit2)


//functions
//name is external name da elly byban lma a3mel call
func sayHello(name param1: String)-> String{//(String) -> String
    print("Hello\(param1)")
    print("Hello",(param1),"hi")
    return "Hello"
}
sayHello(name: "Radya")
/////////////////////////////////
func multiplay (num1: Int , num2:Int) -> Int{//(Int,Int)->Int
    return num1 * num2
}
//function Type
var myVar :(Int,Int)->Int = multiplay
print(myVar(5,6))
/////////////////////////////////
/*
 func sayHello(){//()->void
    
}
sayHello()*/
/////////////////////////////////
/*//method with return
func sayHello()-> String{
    
}
*/
/////////////////////////////////
/*
// method with param and return
func sayHello(param1: String)-> String{
    
}
sayHello(param1: "Radya")
*/
/////////////////////////////////
/*
 //use _ lw mesh 3ayza aktb el esm fel call
func sayHello(_ param1: String)-> String{
    print("Hello")
    return "Hello"
}
sayHello("Radya")
*/
/////////////////////////////////


