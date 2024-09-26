import Cocoa

// Actions to do
func displayMenu() {
    print("""
    Shopping List
    1. Add an item
    2. Remove an item
    3. View shopping list
    4. Exit
    """)
}

// Main program
func shoppingListManager() {
    var shoppingList: [String] = []
    var exit = false
    
    while !exit {
        displayMenu()
        
        if let choice = readLine() {
            switch choice {
            case "1":
                print("Enter the item to add:")
                if let item = readLine() {
                    shoppingList.append(item)
                    print("'\(item)' added to the list")
                }
                
            case "2":
                print("Enter the item to remove:")
                if let item = readLine(), let index = shoppingList.firstIndex(of: item) {
                    shoppingList.remove(at: index)
                    print("'\(item)' removed from the list")
                } else {
                    print("Item not found")
                }
                
            case "3":
                if shoppingList.isEmpty {
                    print("Shopping list is empty")
                } else {
                    print("Current shopping list:")
                    for item in shoppingList {
                        print("- \(item)")
                    }
                }
                
            case "4":
                exit = true
                print("Exiting...")
                
            default:
                print("Invalid choice, try again")
            }
        }
    }
}

// Start the program
shoppingListManager()
