import Foundation

// func for basic operations
func add(a: Double, b: Double) -> Double {
    return a + b
}

func subtract(a: Double, b: Double) -> Double {
    return a - b
}

func multiply(a: Double, b: Double) -> Double {
    return a * b
}

func divide(a: Double, b: Double) -> Double? {
    return b != 0 ? a / b : nil // return a / b if b is not zero, else return nil
}

func calculator() {
    while true {

        print("Enter first number (or type 'exit' to quit):")
        let firstInput = readLine() ?? ""
        if firstInput.lowercased() == "exit" {
            print("Exiting the calculator. Goodbye!")
            break
        }
        
        if let firstNumber = Double(firstInput) {
            
            print("Enter second number (or type 'exit' to quit):")
            let secondInput = readLine() ?? ""
            if secondInput.lowercased() == "exit" {
                print("Exiting the calculator. Goodbye!")
                break
            }
            
            if let secondNumber = Double(secondInput) {
                
                print("Choose an operation (+, -, *, /) (or type 'exit' to quit):")
                let operation = readLine() ?? ""
                if operation.lowercased() == "exit" {
                    print("Exiting the calculator. Goodbye!")
                    break
                }

                var result: Double?

                switch operation {
                case "+":
                    result = add(a: firstNumber, b: secondNumber)
                case "-":
                    result = subtract(a: firstNumber, b: secondNumber)
                case "*":
                    result = multiply(a: firstNumber, b: secondNumber)
                case "/":
                    result = divide(a: firstNumber, b: secondNumber)
                    if result == nil {
                        print("Error: Division by zero is not allowed.")
                        continue
                    }
               default:
                    print("Invalid operation. Please choose +, -, *, or /.")
                    continue
                }

                print("Result: \(result!)")
            } else {
                print("Invalid input for the second number.")
            }
        } else {
            print("Invalid input for the first number.")
        }
    }
}

calculator()