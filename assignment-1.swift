let firstName: String = "Aruzhan"
let lastName: String = "K"
let birthYear: Int = 2004
let currentYear: Int = 2024
var age: Int = currentYear - birthYear
var isStudent: Bool = true
var height: Double = 1.70

let country: String = "KZ"
let favoriteFood: String = "pizza"

var hobby: String = "reading"
var numberOfHobbies: Int = 5
var favoriteNumber: Int = 8
var isHobbyCreative: Bool = true

var favoriteSport: String = "volleyball"
var hasPets: Bool = true

let lifeStory: String = """
My name is \(firstName) \(lastName). I am \(age) years old, born in \(birthYear). 
I am currently a student. I enjoy \(hobby), which is a creative hobby. 
I have \(numberOfHobbies) hobbies in total, and my favorite number is \(favoriteNumber). 
I live in \(country) and I love \(favoriteFood). My favorite sport is \(favoriteSport).
"""

print(lifeStory)
print("\n")

var futureGoals: String = "In the future, I want to become a professional iOS developer. 🚀"
let lifeStoryWithGoals: String = lifeStory + "\n" + futureGoals

print(lifeStoryWithGoals)


