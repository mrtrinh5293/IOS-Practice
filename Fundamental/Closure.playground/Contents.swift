import UIKit

// Closure basic form

func closure (n1: Int) -> Int { n1 + 1 }

func calculator (n1: Int, n2: Int, operation:(Int,Int) -> Int) -> Int {
    return operation(n1, n2)
}


//1
//calculator(n1: 2, n2: 3) { (no1, no2) -> Int in
//    no1 * no2
//}

//2
let result = calculator(n1: 2, n2: 3, operation: {$0 * $1}) // first parameter * 2nd parameter

print(result)

// 3
// -> {$0 * $1} <- trailling closure
let result2 = calculator(n1: 2, n2: 3 ) {$0 * $1}
print(result2)

let array = [3,4,5,6,9]

let addOne = array.map {$0 + 1}
let stringy = array.map{"\($0)"}

print(addOne)
print(stringy)
