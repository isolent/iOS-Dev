//
//  FilmViewController.swift
//  TabbedFaves
//
//  Created by Aruzhan Kaharmanova on 14.11.2024.
//

import UIKit

class FilmViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    let films: [Film] = [
        Film(title: "Inception", author: "Christopher Nolan", genre: "Sci-Fi", poster: #imageLiteral(resourceName: "f1"), description: "Inception is a mind-bending thriller where a skilled thief, Dom Cobb, who has the rare ability to enter people's dreams and steal secrets from their subconscious, is offered a chance to have his criminal history erased. To do so, he must perform an almost impossible task: inception – planting an idea into someone's mind."),
        Film(title: "Human Anger", author: "Guy Ritchie", genre: "Crime", poster: #imageLiteral(resourceName: "f2"), description: "Human Anger follows a man seeking vengeance as he infiltrates the criminal underworld that wronged him. Directed by Guy Ritchie, this intense crime drama explores loyalty, revenge, and the dark side of justice, with Ritchie's signature style and action-packed storytelling."),
        Film(title: "Titanic", author: "James Cameron", genre: "Drama/Romance", poster: #imageLiteral(resourceName: "f3"), description: "Titanic tells the tragic love story of Jack and Rose, two young passengers on the ill-fated RMS Titanic. As the ship meets its catastrophic end, the two must fight for survival in the cold Atlantic waters."),
        Film(title: "The Covenant", author: "Guy Ritchie", genre: "Drama", poster: #imageLiteral(resourceName: "f4"), description: "The Covenant is a gripping thriller by Guy Ritchie that follows the journey of two men bound by a promise. As they navigate a world of danger and deception, loyalty and honor are put to the test, making for a thrilling and emotional story."),
        Film(title: "Gentlemen", author: "Guy Ritchie", genre: "Crime/Drama", poster: #imageLiteral(resourceName: "f5"), description: "Gentlemen is a fast-paced crime drama by Guy Ritchie that follows a British drug lord who decides to sell his empire, setting off a series of schemes, plots, and unexpected challenges from a colorful cast of characters all vying for control."),
        Film(title: "The Dark Knight", author: "Christopher Nolan", genre: "Action", poster: #imageLiteral(resourceName: "f6"), description: "The Dark Knight is a superhero thriller where Batman faces off against his greatest adversary, the Joker. In this dark and intense tale, Batman must confront the fine line between heroism and vigilantism as Gotham City spirals into chaos."),
        Film(title: "The Karate Kid", author: "John G. Avildsen", genre: "Action/Drama", poster: #imageLiteral(resourceName: "f7"), description: "The Karate Kid follows Daniel LaRusso, a young teenager who learns martial arts from Mr. Miyagi to stand up to bullies. Through discipline and guidance, Daniel transforms into a stronger, more confident person ready to face his challenges."),
        Film(title: "The Matrix", author: "The Wachowskis", genre: "Sci-Fi", poster: #imageLiteral(resourceName: "f8"), description: "The Matrix is a sci-fi classic that follows Neo, a hacker who discovers that reality as he knows it is a simulation controlled by machines. Neo is drawn into a rebellion led by Morpheus and Trinity to free humanity from the illusion."),
        Film(title: "Interstellar", author: "Christopher Nolan", genre: "Sci-Fi", poster: #imageLiteral(resourceName: "f9"), description: "Interstellar is an epic sci-fi adventure that follows a team of astronauts on a mission to find a new home for humanity. As Earth faces ecological disaster, Cooper, a former NASA pilot, joins the journey through a wormhole, encountering distant planets and time-warping phenomena in a quest to secure a future for the human race."),
        Film(title: "Gladiator", author: "Ridley Scott", genre: "Historical", poster: #imageLiteral(resourceName: "f10"), description: "Gladiator tells the story of Maximus, a betrayed Roman general who is reduced to slavery and forced to fight as a gladiator. Driven by a desire for vengeance against the emperor who wronged him, Maximus rises in the gladiatorial arena, ultimately seeking justice for his family.")
    ]

    
    @IBOutlet weak var filmTable: UITableView!
    
    private var currentFilmAt: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        filmTable.dataSource = self
        filmTable.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        films.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FilmCell") as! FilmCell
        let film = films[indexPath.row]
        cell.poster.image = film.poster
        cell.title.text = film.title
        cell.author.text = film.author
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToFilmDetail" {
            let destVC = segue.destination as? FilmDetailsViewController
            if let currentFilmAt = currentFilmAt {
                destVC?.configure(with: films[currentFilmAt])
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        currentFilmAt = indexPath.row
        performSegue(withIdentifier: "goToFilmDetail", sender: self)
        tableView.deselectRow(at: indexPath, animated: true)
    }

}
