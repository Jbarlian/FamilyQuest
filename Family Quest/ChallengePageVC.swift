//
//  ChallengePageVC.swift
//  Family Quest
//
//  Created by James Barlian on 10/06/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit
import AVFoundation

class ChallengePageVC: UIViewController {

    var audioPlayer:AVAudioPlayer!
    
    @IBOutlet weak var randomChallenge: UILabel!
    @IBOutlet weak var selectedLabel: UILabel!
    
    var selectedPerson:String = ""
    
    var challenge:[String] = [
         "Tell an embarrassing story",
         "Tell your greatest acomplishments",
         "Tell your biggest fear",
         "Do a silly dance for 1 minute",
         "Describe your favorite food and have the others guess it",
         "Describe your favorite animal and have the others guess it",
         "Describe your favorite movie and have the others guess it",
         "What are you most grateful for today?",
         "Attempt to do cart wheel",
         "Act out your favorite hobby and have the others guess it",
         "Act your your least favorite activity and have the others guess",
         "Describe your favorite drink and have the other guess it",
         "Describe your favorite fruit and have the others guess it",
         "Sing your favorite song and have the others guess the artist",
         "Try to touch your toes without bending your knees",
         "Describe your favorite vacation and have the others guess it",
         "Who do you look up to the most, and what qualities of that person do you love?",
         "What's your favorite memory?",
         "What is your most valued posession and why?",
         "Where do you want to travel the most and why?",
         "If you could only eat one thing for the rest of your life what would it be?",
         "If you had three wishes what would you wish for?",
         "What would your superpower be if you could have one and why?",
         "What foreign language do you want to master and why?",
         "Describe yourself with only using three words",
         "What is your most hated chore and why?",
         "What's your favorite holiday and why?",
         "If you could time travel, where would you go?"
        
        
        ]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.selectedLabel.text = "for, \(selectedPerson)"
        randomChallenge.text = challenge.randomElement()!
        
        // Do any additional setup after loading the view.
        let sound = Bundle.main.path(forResource: "button-click", ofType: "mp3")
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
        }catch
        {
            print(error)
        }
    }
    

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! RatingPageVC
        vc.personToRate = selectedPerson
    }

    @IBAction func doneButton(_ sender: Any) {
        audioPlayer.play()
    }
    
}
