import Cocoa

func isPrime(_ number: Int) -> Bool {
    if number <= 1 {
        return false
    }
    
    var i = 2
    // Check divisors up to the square root of the number
    while i * i <= number {  
        if number % i == 0 {
            return false  
        }
        i += 1
    }
    
    return true  
}

for number in 1...100 {
    if isPrime(number) {
        print(number, terminator: " ") 
    }
}
