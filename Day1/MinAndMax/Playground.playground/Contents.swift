import Foundation

func calMinAndMax(inputArray: Array<Int>) -> (min: Int , max: Int){
    var currentMin = inputArray[0]
    var currentMax = inputArray[0]
    for value in inputArray[1..<inputArray.count]{
        if value < currentMin{
            currentMin = value
        }
        else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin,currentMax)
}
var testArray: [Int] = [ 5 , 2 , 10 , 3 , 4 ]
var res = calMinAndMax(inputArray: testArray)
print("Array =",testArray,"\nMin =",res.min,"\nMax =",res.max)