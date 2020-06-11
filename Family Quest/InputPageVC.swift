//
//  InputPageVC.swift
//  Family Quest
//
//  Created by James Barlian on 10/06/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit

class InputPageVC: UIViewController {

    
    @IBOutlet weak var textPlayerOne: UITextField!
    @IBOutlet weak var textPlayerTwo: UITextField!
    @IBOutlet weak var textPlayerThree: UITextField!
    @IBOutlet weak var textPlayerFour: UITextField!
    
    var playerOne: String = ""
    var playerTwo: String = ""
    var playerThree: String = ""
    var playerFour: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // Do any additional setup after loading the view.
        //MARK: HIDE KEYBOARD WHEN TAPPING ON SCREEN
        
        let tapOnScreen: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))

        tapOnScreen.cancelsTouchesInView = false

        view.addGestureRecognizer(tapOnScreen)
        
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    
    @IBAction func startButton(_ sender: Any) {
        self.playerOne = textPlayerOne.text!
        self.playerTwo = textPlayerTwo.text!
        self.playerThree = textPlayerThree.text!
        self.playerFour = textPlayerFour.text!
        performSegue(withIdentifier: "toWheel", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! WheelPageVC
        vc.pOne = self.playerOne
        vc.pTwo = self.playerTwo
        vc.pThree = self.playerThree
        vc.pFour = self.playerFour
    }
}
 
