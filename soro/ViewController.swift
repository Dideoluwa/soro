//
//  ViewController.swift
//  soro
//
//  Created by DOn on 14/08/2023.
//

import UIKit
import AVFoundation

let synthesizer = AVSpeechSynthesizer()

class ViewController: UIViewController ,UITextFieldDelegate{
    
    
    @IBOutlet weak var textField1: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField1.delegate = self
        
        textField1.placeholder = "Enter word to be pronounced here."
        // Do any additional setup after loading the view.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder() // Hide the keyboard when Return is pressed
        return true
    }
    
    
    @IBAction func submit(_ sender: UIButton) {
        if let userInput = textField1.text {
            do{
                try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
                try AVAudioSession.sharedInstance().setActive(true)
                // Defines what to be pronounced
                let utterance = AVSpeechUtterance(string: userInput)
                
                // Configure the uterance
                utterance.rate = 0.57
                utterance.pitchMultiplier = 0.8
                utterance.postUtteranceDelay = 0.2
                utterance.volume = 0.8
                
                let voice = AVSpeechSynthesisVoice(language: "en-GB")
                
                synthesizer.speak(utterance)
            }  catch let error {
                print(error.localizedDescription)
            }
        }
        textField1.text = ""
    }
    
    
    
    
    
}

