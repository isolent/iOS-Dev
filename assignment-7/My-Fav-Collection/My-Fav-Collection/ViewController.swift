//
//  ViewController.swift
//  My-Fav-Collection
//
//  Created by Aruzhan Kaharmanova on 25.10.2024.
//

import UIKit

struct Book {
    let title: String
    let author: String
    let genre: String
    let poster: UIImage
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return popularBooks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookCell", for: indexPath) as! BookCell
        let book = popularBooks[indexPath.row]
        cell.poster.image = book.poster
        cell.title.text = book.title
        cell.author.text = book.author
        cell.genre.text = book.genre
        
        return cell
    }
    

    @IBOutlet weak var bookTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any adbookditional setup after loading the view.
        bookTable.dataSource = self
        bookTable.delegate = self
        
    }
    
    
    let popularBooks: [Book] = [
        Book(title: "To Kill a Mockingbird", author: "Harper Lee", genre: "Fiction", poster: #imageLiteral(resourceName: "b8")),
        Book(title: "1984", author: "George Orwell", genre: "Dystopian", poster: #imageLiteral(resourceName: "b2")),
        Book(title: "The Great Gatsby", author: "F. Scott Fitzgerald", genre: "Classic", poster: #imageLiteral(resourceName: "b3")),
        Book(title: "Harry Potter and the Sorcerer's Stone", author: "J.K. Rowling", genre: "Fantasy", poster: #imageLiteral(resourceName: "d10")),
        Book(title: "Pride and Prejudice", author: "Jane Austen", genre: "Romance", poster: #imageLiteral(resourceName: "b8")),
        Book(title: "The Hobbit", author: "J.R.R. Tolkien", genre: "Fantasy", poster: #imageLiteral(resourceName: "b6")),
        Book(title: "The Catcher in the Rye", author: "J.D. Salinger", genre: "Literary Fiction", poster: #imageLiteral(resourceName: "b7")),
        Book(title: "The Lord of the Rings", author: "J.R.R. Tolkien", genre: "Fantasy", poster: #imageLiteral(resourceName: "b8")),
        Book(title: "Animal Farm", author: "George Orwell", genre: "Political Satire", poster: #imageLiteral(resourceName: "b9")),
        Book(title: "Moby Dick", author: "Herman Melville", genre: "Adventure", poster: #imageLiteral(resourceName: "d10"))
    ]

    


}

