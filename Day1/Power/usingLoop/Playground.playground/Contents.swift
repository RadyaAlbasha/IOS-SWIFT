import Foundation

//clacPower using Loop
func clacPower(base: Int , power: Int) -> Int {//(Int,Int)->Int
    var resPower:Int = base
    for item in 2...power{
        resPower = resPower * base
    }
    return resPower
}
var testBase:Int = 5
var testPower:Int = 3
print(testBase,"Power",testPower,"=",clacPower(base: testBase , power: testPower))