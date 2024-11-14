//
//  BookViewController.swift
//  TabbedFaves
//
//  Created by Aruzhan Kaharmanova on 14.11.2024.
//

import UIKit

class BookViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {

    let books: [Book] = [
        Book(title: "To Kill a Mockingbird", author: "Harper Lee", genre: "Fiction", poster: #imageLiteral(resourceName: "b1"), description: "Set in the racially charged American South during the 1930s, To Kill a Mockingbird follows young Scout Finch and her brother, Jem, as they witness their father, lawyer Atticus Finch, defend a Black man wrongfully accused of assaulting a white woman. Through Scout’s eyes, readers are introduced to themes of justice, moral growth, and compassion, as she learns about the prejudice and deep social divisions in her community."),
        Book(title: "1984", author: "George Orwell", genre: "Dystopian", poster: #imageLiteral(resourceName: "b2"), description: "George Orwell's 1984 presents a chilling vision of a totalitarian future under the ever-watchful eye of Big Brother. Set in a dystopian society where the government controls every aspect of life—including thought and truth—1984 follows Winston Smith, a low-ranking member of the Party, as he begins to question the oppressive regime."),
        Book(title: "The Great Gatsby", author: "F. Scott Fitzgerald", genre: "Classic", poster: #imageLiteral(resourceName: "b3"), description: "The Great Gatsby is F. Scott Fitzgerald’s timeless story of ambition, love, and the American Dream. Set in the opulent world of 1920s New York, the novel follows the mysterious and wealthy Jay Gatsby as he pursues his obsession with the beautiful Daisy Buchanan. Narrated by Nick Carraway, Gatsby’s neighbor, the story explores themes of wealth, desire, social status, and the elusive nature of happiness."),
        Book(title: "Harry Potter and the Sorcerer's Stone", author: "J.K. Rowling", genre: "Fantasy", poster: #imageLiteral(resourceName: "рз"), description: "Harry Potter and the Sorcerer’s Stone introduces readers to Harry Potter, a young boy who, on his eleventh birthday, learns that he is not just an ordinary child but a wizard. Orphaned and raised by his cruel aunt and uncle, Harry discovers he has inherited magical powers and is invited to attend Hogwarts School of Witchcraft and Wizardry. There, he makes friends, uncovers secrets, and learns about his own mysterious past."),
        Book(title: "Pride and Prejudice", author: "Jane Austen", genre: "Romance", poster: #imageLiteral(resourceName: "b5 1"), description: "Pride and Prejudice follows the lives of the Bennet family, particularly the strong-willed and witty Elizabeth Bennet. Set in early 19th-century England, the novel explores themes of social class, marriage, and morality. Elizabeth’s initial dislike of the wealthy, seemingly arrogant Mr. Darcy gradually transforms as she learns more about him, challenging her own judgments and understanding of pride and prejudice."),
        Book(title: "The Hobbit", author: "J.R.R. Tolkien", genre: "Fantasy", poster: #imageLiteral(resourceName: "b6"), description: "The Hobbit tells the story of Bilbo Baggins, a quiet and content hobbit from the Shire who is unexpectedly swept into an epic adventure. Recruited by the wizard Gandalf and a company of dwarves, Bilbo embarks on a quest to reclaim the dwarves' homeland and treasure from the fearsome dragon Smaug. Along the way, he encounters trolls, goblins, elves, and a mysterious creature named Gollum, from whom he obtains a powerful and enigmatic ring."),
        Book(title: "The Catcher in the Rye", author: "J.D. Salinger", genre: "Literary Fiction", poster: #imageLiteral(resourceName: "b7 1"), description: "The Catcher in the Rye follows the story of Holden Caulfield, a teenager struggling with the complexities of adolescence and alienation. Recently expelled from yet another school, Holden roams New York City, grappling with his disillusionment toward society, loneliness, and confusion about adulthood. Told in Holden’s candid and often cynical voice, the novel explores themes of innocence, identity, and rebellion against societal expectations."),
        Book(title: "The Lord of the Rings", author: "J.R.R. Tolkien", genre: "Fantasy", poster: #imageLiteral(resourceName: "b8"), description: "The Lord of the Rings is an epic fantasy novel that follows the journey of Frodo Baggins, a hobbit tasked with destroying a powerful and dangerous artifact, the One Ring, to prevent the Dark Lord Sauron from conquering Middle-earth. Joined by a fellowship of diverse companions—ranging from humans and elves to dwarves and other hobbits—Frodo embarks on a perilous journey filled with battles, betrayals, and profound personal growth."),
        Book(title: "A feeling stronger than fear", author: "Mark Levy", genre: "literature", poster: #imageLiteral(resourceName: "b9"), description: "A Feeling Stronger Than Fear is a gripping novel by Marc Levy that delves into the complexities of love, fear, and destiny. The story follows Mia, a young woman who embarks on a life-changing journey after encountering a mysterious man named Jonathan. Their connection is instant, yet the shadows of their pasts, filled with loss and unresolved emotions, threaten to pull them apart."),
        Book(title: "Moby Dick", author: "Herman Melville", genre: "Adventure", poster: #imageLiteral(resourceName: "d10"), description: "Moby-Dick is an iconic American novel by Herman Melville, centered around the obsessive quest of Captain Ahab to capture the great white whale, Moby Dick. The story is narrated by Ishmael, a sailor aboard Ahab's whaling ship, the Pequod, who recounts the perilous journey into the vast oceans. As Ahab's obsession with the whale grows, he disregards the well-being of his crew and risks everything in pursuit of vengeance against the creature that maimed him.")
    ]
    
    @IBOutlet weak var bookTable: UITableView!
    private var currentBookAt: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bookTable.dataSource = self
        bookTable.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        books.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookCell") as! BookCell
        let book = books[indexPath.row]
        cell.poster.image = book.poster
        cell.title.text = book.title
        cell.author.text = book.author
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToBookDetail" {
            let destVC = segue.destination as? BookDetailsViewController
            if let currentBookAt = currentBookAt {
                destVC?.configure(with: books[currentBookAt])
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        currentBookAt = indexPath.row
        performSegue(withIdentifier: "goToBookDetail", sender: self)
        tableView.deselectRow(at: indexPath, animated: true)
    }

}
