import Cocoa

// func to calculate and display student grades
func gradeCalculator() {
    var students: [String: Int] = [:]

    print("Enter student names and scores (type 'exit' to finish):")
    
    while true {
        print("Enter student name:")
        let name = readLine() ?? ""
        if name.lowercased() == "exit" { break }
        
        print("Enter \(name)'s score:")
        if let scoreInput = readLine(), let score = Int(scoreInput) {
            students[name] = score
        } else {
            print("Invalid score. Please enter a valid number.")
        }
    }
    
    // calc average, highest, and lowest scores
    guard !students.isEmpty else {
        print("No student data provided.")
        return
    }
    
    var totalScore = 0
    var highestScore = Int.min
    var lowestScore = Int.max

    for score in students.values {
        totalScore += score
        highestScore = max(highestScore, score)
        lowestScore = min(lowestScore, score)
    }

    let averageScore = Double(totalScore) / Double(students.count)

    // results
    print("\nStudent Scores:")
    for (name, score) in students {
        let status = score >= Int(averageScore) ? "Above Average" : "Below Average"
        print("\(name): \(score) - \(status)")
    }

    print("\nAverage Score: \(averageScore)")
    print("Highest Score: \(highestScore)")
    print("Lowest Score: \(lowestScore)")
}

gradeCalculator()
