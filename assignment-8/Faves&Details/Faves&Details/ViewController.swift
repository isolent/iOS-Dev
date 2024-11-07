//
//  ViewController.swift
//  Faves&Details
//
//  Created by Aruzhan Kaharmanova on 03.11.2024.
//

import UIKit

class ViewController: UIViewController {
    
    private var books: [Book] = [
        Book(title: "To Kill a Mockingbird", author: "Harper Lee", genre: "Fiction", poster: #imageLiteral(resourceName: "b1"), description: "Set in the racially charged American South during the 1930s, To Kill a Mockingbird follows young Scout Finch and her brother, Jem, as they witness their father, lawyer Atticus Finch, defend a Black man wrongfully accused of assaulting a white woman. Through Scout’s eyes, readers are introduced to themes of justice, moral growth, and compassion, as she learns about the prejudice and deep social divisions in her community. Harper Lee’s powerful storytelling and memorable characters make this novel an enduring classic on courage, empathy, and the struggle for equality."),
        Book(title: "1984", author: "George Orwell", genre: "Dystopian", poster: #imageLiteral(resourceName: "b2"), description: "George Orwell's 1984 presents a chilling vision of a totalitarian future under the ever-watchful eye of Big Brother. Set in a dystopian society where the government controls every aspect of life—including thought and truth—1984 follows Winston Smith, a low-ranking member of the Party, as he begins to question the oppressive regime. Forbidden to think freely, to love, or to express individual beliefs, Winston struggles for personal autonomy and truth in a world that rewrites history and denies reality. Orwell’s novel remains a powerful warning about the dangers of totalitarianism, mass surveillance, and the erosion of personal freedoms."),
        Book(title: "The Great Gatsby", author: "F. Scott Fitzgerald", genre: "Classic", poster: #imageLiteral(resourceName: "b3"), description: "The Great Gatsby is F. Scott Fitzgerald’s timeless story of ambition, love, and the American Dream. Set in the opulent world of 1920s New York, the novel follows the mysterious and wealthy Jay Gatsby as he pursues his obsession with the beautiful Daisy Buchanan. Narrated by Nick Carraway, Gatsby’s neighbor, the story explores themes of wealth, desire, social status, and the elusive nature of happiness. Through Gatsby’s tragic pursuit of love and status, Fitzgerald offers a critique of the empty pursuit of material success and the fragile nature of human aspirations, making The Great Gatsby a profound exploration of love and loss amidst the excesses of the Jazz Age."),
        Book(title: "Harry Potter and the Sorcerer's Stone", author: "J.K. Rowling", genre: "Fantasy", poster: #imageLiteral(resourceName: "рз"), description: "Harry Potter and the Sorcerer’s Stone introduces readers to Harry Potter, a young boy who, on his eleventh birthday, learns that he is not just an ordinary child but a wizard. Orphaned and raised by his cruel aunt and uncle, Harry discovers he has inherited magical powers and is invited to attend Hogwarts School of Witchcraft and Wizardry. There, he makes friends, uncovers secrets, and learns about his own mysterious past. With the help of friends like Hermione Granger and Ron Weasley, Harry faces dark forces and begins his journey to confront the powerful dark wizard, Voldemort. This enchanting start to the Harry Potter series is filled with magic, friendship, and adventure, captivating readers as they step into the magical world of Hogwarts"),
        Book(title: "Pride and Prejudice", author: "Jane Austen", genre: "Romance", poster: #imageLiteral(resourceName: "b5 1"), description: "Pride and Prejudice follows the lives of the Bennet family, particularly the strong-willed and witty Elizabeth Bennet. Set in early 19th-century England, the novel explores themes of social class, marriage, and morality. Elizabeth’s initial dislike of the wealthy, seemingly arrogant Mr. Darcy gradually transforms as she learns more about him, challenging her own judgments and understanding of pride and prejudice. Through humor, lively characters, and keen social commentary, Austen crafts a timeless love story that remains one of literature’s most beloved romances, exploring both the complexity of human relationships and the constraints of society."),
        Book(title: "The Hobbit", author: "J.R.R. Tolkien", genre: "Fantasy", poster: #imageLiteral(resourceName: "b6"), description: "The Hobbit tells the story of Bilbo Baggins, a quiet and content hobbit from the Shire who is unexpectedly swept into an epic adventure. Recruited by the wizard Gandalf and a company of dwarves, Bilbo embarks on a quest to reclaim the dwarves' homeland and treasure from the fearsome dragon Smaug. Along the way, he encounters trolls, goblins, elves, and a mysterious creature named Gollum, from whom he obtains a powerful and enigmatic ring. Filled with themes of bravery, friendship, and self-discovery, The Hobbit is a richly woven tale that introduces readers to Tolkien's expansive Middle-earth, serving as a prelude to the epic Lord of the Rings trilogy."),
        Book(title: "The Catcher in the Rye", author: "J.D. Salinger", genre: "Literary Fiction", poster: #imageLiteral(resourceName: "b7 1"), description: "The Catcher in the Rye follows the story of Holden Caulfield, a teenager struggling with the complexities of adolescence and alienation. Recently expelled from yet another school, Holden roams New York City, grappling with his disillusionment toward society, loneliness, and confusion about adulthood. Told in Holden’s candid and often cynical voice, the novel explores themes of innocence, identity, and rebellion against societal expectations. Salinger's portrayal of Holden’s journey has resonated with generations of readers, capturing the angst and rebellion of youth with emotional depth and authenticity"),
        Book(title: "The Lord of the Rings", author: "J.R.R. Tolkien", genre: "Fantasy", poster: #imageLiteral(resourceName: "b8"), description: "The Lord of the Rings is an epic fantasy novel that follows the journey of Frodo Baggins, a hobbit tasked with destroying a powerful and dangerous artifact, the One Ring, to prevent the Dark Lord Sauron from conquering Middle-earth. Joined by a fellowship of diverse companions—ranging from humans and elves to dwarves and other hobbits—Frodo embarks on a perilous journey filled with battles, betrayals, and profound personal growth. As the characters face trials and face their deepest fears, Tolkien weaves a rich tapestry of adventure, friendship, and the ongoing struggle between good and evil. This timeless classic is celebrated for its intricate world-building, moral depth, and exploration of themes such as courage, sacrifice, and the corrupting influence of power."),
        Book(title: "A feeling stronger than fear", author: "Mark Levy", genre: "literature", poster: #imageLiteral(resourceName: "b9"), description: "A Feeling Stronger Than Fear is a gripping novel by Marc Levy that delves into the complexities of love, fear, and destiny. The story follows Mia, a young woman who embarks on a life-changing journey after encountering a mysterious man named Jonathan. Their connection is instant, yet the shadows of their pasts, filled with loss and unresolved emotions, threaten to pull them apart. As they confront their fears, the novel explores the idea that love, trust, and the pursuit of truth can be more powerful than the fears that haunt them. Levy intertwines elements of mystery and romance, creating a story that challenges the characters' beliefs and reveals how embracing vulnerability can lead to profound personal transformation. The novel explores themes such as courage, healing from trauma, and the resilience of the human spirit in the face of adversity, making it a thought-provoking and emotional read"),
        Book(title: "Moby Dick", author: "Herman Melville", genre: "Adventure", poster: #imageLiteral(resourceName: "d10"), description: "Moby-Dick is an iconic American novel by Herman Melville, centered around the obsessive quest of Captain Ahab to capture the great white whale, Moby Dick. The story is narrated by Ishmael, a sailor aboard Ahab's whaling ship, the Pequod, who recounts the perilous journey into the vast oceans. As Ahab's obsession with the whale grows, he disregards the well-being of his crew and risks everything in pursuit of vengeance against the creature that maimed him. The novel explores profound themes of fate, vengeance, the limits of human understanding, and the struggle between man and nature. Through its philosophical musings, vivid descriptions of life at sea, and symbolic use of the whale, Moby-Dick is a tale of obsession, madness, and the complex forces that drive human behavior. Celebrated for its deep exploration of existential questions, it remains a cornerstone of American literature.")
    ]

    @IBOutlet weak var bookTable: UITableView!
    private var selectedBook: Book?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bookTable.dataSource = self
        bookTable.delegate = self
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destVC = segue.destination as? DetailsPage else {
            return
        }
        destVC.configure(with: selectedBook)
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedBook = books[indexPath.row]
        performSegue(withIdentifier: "goToDetail", sender: nil)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookCell", for: indexPath) as! BookCell
        let currentModel = books[indexPath.row]
        cell.configure(currentModel)
        return cell
    }
}
