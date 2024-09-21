import Foundation
// Function for converting and printing results
func convertTemperature(value: Double, unit: String) {
    switch unit.uppercased() {
    case "C":
        let fahrenheit = (value * 9/5) + 32
        let kelvin = value + 273
        print("\(value)°C = \(fahrenheit)°F = \(kelvin)K")
        
    case "F":
        let celsius = (value - 32) * 5/9
        let kelvin = (value - 32) * 5/9 + 273
        print("\(value)°F = \(celsius)°C = \(kelvin)K")
        
    case "K":
        let celsius = value - 273
        let fahrenheit = (value - 273) * 9/5 + 32
        print("\(value)K = \(celsius)°C = \(fahrenheit)°F")
        
    default:
        print("Invalid unit. Enter C, F, or K.")
    }
}

// Main program 
print("Temperature value:")
if let input = readLine(), let temperature = Double(input) {
    
    print("Unit(C, K or F):")
    if let unit = readLine() {
        convertTemperature(value: temperature, unit: unit)
    } else {
        print("Error reading the unit.")
    }
    
} else {
    print("Error reading the temperature value.")
}
