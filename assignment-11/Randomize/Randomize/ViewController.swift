//
//  ViewController.swift
//  RandomHero
//
//  Created by Aruzhan Kaharmanova on 21.11.2024.
//

import UIKit
import Kingfisher
import Alamofire

struct Hero: Decodable {
    let name: String
    let images: HeroImage
    let biography: Biography
    let appearance: Appearance
    let powerstats: PowerStats
    
    struct HeroImage: Decodable {
        let sm: String
    }
    
    struct Biography: Decodable {
        let fullName: String
    }
    
    struct PowerStats: Decodable {
        let intelligence: Int
        let strength: Int
        let power: Int
        let speed: Int
        let combat: Int
    }
    
    struct Appearance: Decodable {
        let gender: String
        let race: String?
    }
}

class ViewController: UIViewController {
    
    @IBOutlet weak var heroImage: UIImageView!
    @IBOutlet weak var heroName: UILabel!
    @IBOutlet weak var heroGender: UILabel!
    @IBOutlet weak var heroFullName: UILabel!
    @IBOutlet weak var heroSpeed: UILabel!
    @IBOutlet weak var heroStrength: UILabel!
    @IBOutlet weak var heroRace: UILabel!
    @IBOutlet weak var heroPower: UILabel!
    @IBOutlet weak var heroIntelligence: UILabel!
    @IBOutlet weak var heroCombat: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func heroButtonDidTap(_ sender: Any) {
        let randomId = Int.random(in: 1...563)
        fetchHero(by: randomId)
    }
    
    private func fetchHero(by id: Int) {
        let urlString = "https://akabab.github.io/superhero-api/api/id/\(id).json"
        
        // Use Alamofire to make a GET request
        AF.request(urlString).responseDecodable(of: Hero.self) { response in
            switch response.result {
            case .success(let hero):
                self.updateUI(with: hero)
            case .failure(let error):
                self.handleError(error: error)
            }
        }
    }
    
    private func updateUI(with hero: Hero) {
        DispatchQueue.main.async {
            self.heroName.text = "Name: \(hero.name)"
            self.heroFullName.text = "Fullname: \(hero.biography.fullName)"
            self.heroGender.text = "Gender: \(hero.appearance.gender)"
            self.heroSpeed.text = "Speed: \(hero.powerstats.speed)"
            self.heroIntelligence.text = "Intelligence: \(hero.powerstats.intelligence)"
            self.heroStrength.text = "Strength: \(hero.powerstats.strength)"
            self.heroRace.text = "Race: \(hero.appearance.race ?? "Unknown")"
            self.heroPower.text = "Power: \(hero.powerstats.power)"
            self.heroCombat.text = "Combat: \(hero.powerstats.combat)"
            
            // Use Kingfisher to load the image
            if let imageUrl = URL(string: hero.images.sm) {
                self.heroImage.kf.setImage(with: imageUrl)
            } else {
                self.heroImage.image = nil
            }
        }
    }
    
    private func handleError(error: AFError) {
        DispatchQueue.main.async {
            self.heroName.text = "Error: \(error.localizedDescription)\nReRoll again!"
            self.heroFullName.text = ""
            self.heroImage.image = nil
        }
    }
}
