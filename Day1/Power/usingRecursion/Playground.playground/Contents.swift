import Foundation

//clacPower using recursion
func clacPower(base: Int , power: Int) -> Int {//(Int,Int)->Int
    var resPower:Int
    if power == 1{
        resPower = base
    }
    else{
        resPower = base * clacPower(base: base , power: power - 1)
    }

    return resPower
}

var testBase:Int = 5
var testPower:Int = 3
print(testBase,"Power",testPower,"=",clacPower(base: testBase , power: testPower))