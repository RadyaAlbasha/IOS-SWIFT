import UIKit

var str = "Hello, playground"
var x = 10
class Parent{
    var myStored : Int = 0
    var myComputed : Double{
        get{
            return 5*6
        }
        set{
            print("Setted")
        }
    }
    func sayHi(){
        print("Hi Parent")
    }
    init(){
        print("parent init")
    }
}
class Child : Parent{
    override var myStored : Int {
        get{
            return 5*6
        }
        set{
            print("Setted")
        }
    }
    //override var myComputed : Double = 9 //cannot overide with a stored property
//    override var myComputed : Double{
//        get{
//            return 5*6
//        }
//        set{
//            print("Setted")
//        }
//    }
    ///////////////////////////////////
//    override var myStored : Int {
//        willSet{
//            print("will Setted")
//        }
//        didSet{
//            print("did Setted")
//        }
//   }
    /////////////////////////////////
    override var myComputed : Double{
        willSet{
                   print("will Setted")
                }
        didSet{
                   print("did Setted")
                }
    }
    override func sayHi(){
        print("Hi Child")
    }
    
    override init(){
        //super.init() //3shan agbero ynady init el parent el awel
        print("child init")
    }
}
var obj = Parent()
obj.myComputed = 5
print(obj.myComputed)

var objC = Child()
objC.sayHi()
