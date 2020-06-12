//
//  HomePageVC.swift
//  Family Quest
//
//  Created by James Barlian on 10/06/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit
import AVFoundation

class HomePageVC: UIViewController {

    var audioPlayer:AVAudioPlayer!
    var introMusic:AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let sound = Bundle.main.path(forResource: "button-click", ofType: "mp3")
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
        }catch
        {
            print(error)
        }
        
        let introSound = Bundle.main.path(forResource: "Intro-music", ofType: "mp3")
        do{
            introMusic = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: introSound!))
        }catch
        {
            print(error)
        }
       
        introMusic.numberOfLoops = 5
        introMusic.play()
    }
    
    @IBAction func playButton(_ sender: Any) {
        audioPlayer.play()
    }
    
}
