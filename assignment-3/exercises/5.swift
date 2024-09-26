import Cocoa

// function to count the frequency of words
func countWordFrequency(sentence: String) -> [String: Int] {
    // convert to lowercase and remove punctuation
    let cleanedSentence = sentence.lowercased()
    let words = cleanedSentence.components(separatedBy: CharacterSet.punctuationCharacters)
    let finalWords = words.joined(separator: " ").components(separatedBy: " ")
    
    
    // create empty dictionary

    var wordCount: [String: Int] = [:]
    // count the frequency of each word
    
    for word in finalWords where !word.isEmpty {
        wordCount[word, default: 0] += 1
    }
    
    return wordCount
}

print("Enter a sentence:")
if let sentence = readLine() {
    let frequencies = countWordFrequency(sentence: sentence)
    
    for (word, count) in frequencies {
        print("\(word) - \(count)")
    }
}
