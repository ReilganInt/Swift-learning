//
//  ViewController.swift
//  simpleApp
//
//  Created by admin on 11/12/2019.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var timer:Timer?
    var seconds = 60
    
    @IBOutlet weak var scoreLabel: UILabel?
    @IBOutlet weak var timeLable: UILabel?
    
    @IBOutlet weak var numberLabel: UILabel?
    @IBOutlet weak var inputfield: UITextField?
    
    @IBAction func inputFieldDidChange(){
        
        guard let numberText = numberLabel?.text, let inputText = inputfield?.text else {
            return
        }
        
        guard inputText.count == 4 else {
            return
        }
        
        var isCorrect = true
        
        for n in 0..<4 {
            var input = inputText.integer(at: n)
            let number = numberText.integer(at: n)
        
            if input == 0 {
                input = 10
            }
            if input != number + 1 {
                isCorrect = !isCorrect
                break
            }
        }
        
        if isCorrect {
            score += 1
        } else {
            score -= 1
        }
        
        updateNumberLabel()
        updateScoreLabel()
        inputfield?.text = ""
        
        if timer == nil {
            timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
                if self.seconds <= 60 {
                    self.seconds -= 1
                    self.updateTimeLabel()
                }
            }
        }
    }
    
    func updateTimeLabel() {
        
        let min = (seconds / 60) % 60
        let sec = seconds % 60
        

        timeLable?.text = String(format: "%02d", min) + ":" + String(format: "%02d", sec)
        if seconds == 0 {
            finishGame()
        }
    }
    
    func finishGame() {
        timer?.invalidate()
        timer = nil
        
        let alert = UIAlertController(title: "Time's Up!", message: "Your time is up! You got a score of \(score) points. Awesome!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK, start new game", style: .default, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
        
        score = 0
        seconds = 60
        
        updateScoreLabel()
        updateNumberLabel()
        updateTimeLabel()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateScoreLabel()
        updateNumberLabel()
        updateTimeLabel()
        // Do any additional setup after loading the view.
    }
    
    var score = 0
    
    func updateScoreLabel() {
        scoreLabel?.text = String(score)
    }

    func updateNumberLabel() {
        numberLabel?.text = String.randomNumber(length: 4)
    }
    
}

