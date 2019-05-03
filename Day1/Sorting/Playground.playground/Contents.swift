import Foundation

func getMin(inputArray: Array<Int>) -> (min: Int , index: Int){
    var currentMin = inputArray[0]
    var minIndex = 0
    var i = 0
    for value in inputArray[0..<inputArray.count]{
        if value < currentMin{
            currentMin = value
            minIndex = i
        }
        i = i + 1
    }
    return (currentMin,minIndex)
}

func sortArray(inputArray: Array<Int>) -> Array<Int> {
    var testArray = inputArray
    var sortedArray: [Int] = Array()
    while (testArray.count > 0) {
        var minValue = getMin(inputArray: testArray)
       sortedArray.append(minValue.0)
       testArray.remove(at: minValue.1)
    }

    return sortedArray
}

var testArray: [Int] = [ 5 , 2 , 10 , 3 , 4 ]
print("Array=",testArray,"\nsortedArray =",sortArray(inputArray: testArray))