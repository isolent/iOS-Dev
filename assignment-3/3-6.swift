import Foundation

// func for fibonacci sequence
func fibonacci(n: Int) -> [Int] {
    // return empty array for non-positive n
    if n <= 0 {
        return []
    }
    
    var sequence: [Int] = []  

    for i in 0..<n {
        if i == 0 {
            sequence.append(0)  
        } else if i == 1 {
            sequence.append(1)  
        } else {
            let nextNumber = sequence[i - 1] + sequence[i - 2]  //fibonacci formula
            sequence.append(nextNumber)
        }
    }
    return sequence 
}


print("Number of fibonacci numbers:")
if let input = readLine(), let n = Int(input) {
    let fibonacciSequence = fibonacci(n: n)
    print("Fibonacci sequence: \(fibonacciSequence)")
}