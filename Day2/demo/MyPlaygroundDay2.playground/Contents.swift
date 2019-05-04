import UIKit

var str = "Hello, playground"

//by3mel member wise initialzer
struct MyStruct{
    var name : String
    var title : String
    var age : Float
    //var name : String = ""
    //var title : String = ""
    //var age : Float = 0.0
}

//lazem a3mel initialze
class ClassA{
    var name : String = ""
    var title : String = ""
    var age : Float = 0.0
    var myArr = [1,2,3,4,5,6,7,8,9,10]
    
    subscript(index: Int)->Int{
        
        get{
            return myArr[index]
        }
        set{
            myArr[index] = newValue //newValue de key word hwa 3amlha w ana ast3mlha
        }
       /* set(myNewValue){
            myArr[index] = myNewValue //w da lw 3ayza ast3ml word bdl newValue
        }*/
        //mesh lazem a3mel setter w sa3tha htb2a read only
        //return myArr[index] // de keda get men 3'er set mesh lazem akteb get
        
    }
}

//lazem adelo keyam 3shan ana mesh 3amla initialze
var objStruct = MyStruct(name: "Radya", title: "MyTitle", age: 25.0)
var objClass = ClassA()

print(objClass[0])
objClass[0] = 6
print(objClass[0])

//////////////
var myObserver : Int = 0{
    willSet{
        print("About to change to",newValue)
    }
    /*
    willSet(myNewValue){
     print("About to change to",myNewValue) // deafult : newValue
    }*/
    didSet{//momken a7ot nickname
        print("old value :",oldValue)
        print("new value :",myObserver)
    }
}
myObserver = 10
