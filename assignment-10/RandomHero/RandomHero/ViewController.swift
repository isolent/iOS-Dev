//
//  ViewController.swift
//  RandomHero
//
//  Created by Aruzhan Kaharmanova on 21.11.2024.
//

import UIKit

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
        guard let url = URL(string: urlString) else { return }
        let urlRequest = URLRequest(url: url)

        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            guard self.handleErrorIfNeeded(error: error) == false else {
                return
            }

            guard let data else { return }
            self.handleHeroData(data: data)
        }.resume()
    }

    private func handleHeroData(data: Data) {
        do {
            let hero = try JSONDecoder().decode(Hero.self, from: data)
            let heroImage = self.getImageFromUrl(string: hero.images.sm)

            
            DispatchQueue.main.async {
                self.heroName.text = "Name: \(hero.name)"
                self.heroImage.image = heroImage
                self.heroFullName.text = "Fullname: \(hero.biography.fullName)"
                self.heroGender.text = "Gender \(hero.appearance.gender)"
                self.heroSpeed.text = "Speed: \(hero.powerstats.speed)"
                self.heroIntelligence.text = "Intelligence: \(hero.powerstats.intelligence)"
                self.heroStrength.text = "Strength: \(hero.powerstats.strength)"
                self.heroRace.text = "Race: \(hero.appearance.race)"
                self.heroPower.text = "Power: \(hero.powerstats.power)"
                self.heroCombat.text = "Combat: \(hero.powerstats.combat)"
            }
        } catch {
            DispatchQueue.main.async {
                self.heroName.text = error.localizedDescription + "\nReRoll again!"
                self.heroFullName.text = ""
                self.heroImage.image = nil
            }
        }
    }

    private func getImageFromUrl(string: String) -> UIImage? {
        guard
            let heroImageURL = URL(string: string),
            let imageData = try? Data(contentsOf: heroImageURL)
        else {
            return nil
        }
        return UIImage(data: imageData)
    }

    private func handleErrorIfNeeded(error: Error?) -> Bool {
        guard let error else {
            return false
        }
        print(error.localizedDescription)
        return true
    }
}
