//
//  ViewController.swift
//  Xylophone
//
//  Created by Aruzhan Kaharmanova on 11.10.2024.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate {
    
    var audio: AVAudioPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
      
        if let selectedSound = sender.titleLabel?.text {
            playingSound(chosenSound: selectedSound)
        } else {
            print("Button has no title")
        }
    }
    
    func playingSound(chosenSound: String) {
        if let soundURL = Bundle.main.url(forResource: chosenSound, withExtension: "wav") {
            do {
                audio?.stop()
                
                audio = try AVAudioPlayer(contentsOf: soundURL)
                audio?.prepareToPlay()
                audio?.play()
            } catch {
                print("Error playing sound: \(error)")
            }
        } else {
            print("Sound file not found for \(chosenSound)")
        }
    }
}
