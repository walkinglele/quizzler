//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var quizLabel: UILabel!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var QuizBrain = QuizBrain()
    
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateQuiz()
    }
    
    @IBAction func buttonAnswer(_ sender: UIButton) {
        timer.invalidate()
        
        let userAnswer = sender.currentTitle!
        let actualAnswer = QuizBrain.checkAnswer(userAnswer: userAnswer)
        
        if actualAnswer {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        QuizBrain.nextQuestion()
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateQuiz), userInfo: nil, repeats: false)
    }
    
    @objc func updateQuiz(){
        quizLabel.text = QuizBrain.getQuestionText()
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        progressBar.progress = QuizBrain.getProgress()
        scoreLabel.text = "Score: \(QuizBrain.getScore())"
        
    }
    
    
}

