//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let allQuestions = QuestionBank()
    var pickedAns:Bool = false
    var questionNum:Int = 0
    var correctAns:Bool = false
    var score:Int = 0
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let firstQuestion = allQuestions.list[questionNum]
        questionLabel.text = firstQuestion.questionText
        correctAns = firstQuestion.answer
        scoreLabel.text = "Score: 0"
        progressLabel.text = "1 / 13"
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
        if sender.tag == 1  {
            pickedAns = true
        } else {
            pickedAns = false
        }
        checkAnswer()
    }
    
    
    func updateUI() {
        scoreLabel.text = "Score: \(score)"
        progressLabel.text = "\(questionNum+1) / 13"
        
        progressBar.frame.size.width = (view.frame.size.width / 13) * CGFloat(questionNum + 1)
    }
    

    func nextQuestion() {
        questionLabel.text = allQuestions.list[questionNum].questionText
        correctAns = allQuestions.list[questionNum].answer
        updateUI()
    }
    
    
    func checkAnswer() {
        if pickedAns == correctAns {
            print("Correct")
            score += 1
        } else {
            print("Incorrect")
        }
        questionNum = questionNum + 1
        if questionNum >= allQuestions.list.count {
            let alert = UIAlertController(title: "Game Over", message: "Game will now reset", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in NSLog("The \"OK\" alert occured.")}))
            self.present(alert, animated: true, completion: nil)
            print("Game Over")
            questionNum = 0
            score = 0
        }
        nextQuestion()
    }
    
    
    func startOver() {
       
    }
    

    
}
