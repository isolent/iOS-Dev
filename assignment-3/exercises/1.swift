import Cocoa

for i in 1...100{
    if (i%5 == 0 && i%3 == 0){
        print ("FizzBuzz", terminator: " ")
    } else if (i%3 == 0){
        print ("Fizz", terminator: " ")
    } else if (i%5 == 0){
        print ("Buzz", terminator: " ")
    }
    else{
        print (i, terminator: " ")
    }
}
