let firstName: String = "Aruzhan"
let lastName: String = "K"
let birthYear: Int = 2004
let currentYear: Int = 2024
var age: Int = currentYear - birthYear
var isStudent: Bool = true
var height: Double = 1.70

let country: String = "KZ"
let favoriteFood: String = "pizza"
let favoriteColor: String = "blue"
let favoriteMovie: String = "Inception"

var hobby: String = "reading"
var numberOfHobbies: Int = 5
var favoriteNumber: Int = 8
var isHobbyCreative: Bool = true

var favoriteSport: String = "volleyball"
var hasPets: Bool = true
var petName: String = "Simba" 

var languagesLearning: [String] = ["Swift", "Python", "Javascript"]
var funFact: String = "I can speak four languages!"
var dreamDestination: String = "Switzerland"

var lifeStory: String = """
My name is \(firstName) \(lastName). I am \(age) years old, born in \(birthYear). 
I am currently a student. I enjoy \(hobby), which is a creative hobby. 
I have \(numberOfHobbies) hobbies in total, and my favorite number is \(favoriteNumber). 
I live in \(country) and I love \(favoriteFood). My favorite sport is \(favoriteSport). 
My favorite color is \(favoriteColor) and I love the movie \(favoriteMovie).
I have a pet named \(petName), and I am learning \(languagesLearning.joined(separator: ", ")) languages.
Fun fact: \(funFact)
"""

var futureGoals: String = "In the future, I want to become a good it specialist. 🚀"
var travelDream: String = "I also dream of visiting \(dreamDestination) one day."

lifeStory.append("\n" + futureGoals)
lifeStory.append("\n" + travelDream)

print(lifeStory)
