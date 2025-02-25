//
//  QuestionViewController.swift
//  Personality Quiz
//
//  Created by Samuel Bradshaw  on 2/25/25.
//

import UIKit

class QuestionViewController: UIViewController {
    
    @IBOutlet var rangedStackView: UIStackView!
    
    @IBOutlet var singleStackView: UIStackView!
    
    @IBOutlet var multipleStackView: UIStackView!
    
    var questions: [Question] = [
        Question(
            text: "which is your favorite food?",
            type: .single,
            answers: [Answer(text: "sushi", type: .water),
                      Answer(text: "french fries", type: .earth),
                      Answer(text: "spicy ramen", type: .fire),
                      Answer(text: "veggie burger", type: .air)
            ]
        ),
        Question(
            text: "Which of the following do you enjoy?",
            type: .multiple,
            answers: [Answer(text: "swimming", type: .water),
                      Answer(text: "running", type: .earth),
                      Answer(text: "boxing", type: .fire),
                      Answer(text: "acrobatics", type: .air)
            ]
        ),
        Question(
            text: "what kind of driver are you?",
            type: .single,
            answers: [Answer(text: "I go 5 below the speed limit.", type: .water),
                      Answer(text: "I go 5-10 over the speed limit.", type: .earth),
                      Answer(text: "my foot never leaves the pedal.", type: .fire),
                      Answer(text: "I drive the speed limit", type: .air)
            ]
        ),
        Question(
            text: "what kind of activities do you enjoy?",
            type: .ranged,
            answers: [Answer(text: "I like to relax", type: .water),
                      Answer(text: "I like team sports", type: .earth),
                      Answer(text: "ADRENALINE", type: .fire),
                      Answer(text: "I enjoy nature", type: .air)
            ]
        ),
    ]
    
    var questionIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        // Do any additional setup after loading the view.
    }
    func updateUI() {
        singleStackView.isHidden = true
        multipleStackView.isHidden = true
        rangedStackView.isHidden = true
        
        navigationItem.title = "Question #\(questionIndex + 1)"
        
        let currentQuestion = questions[questionIndex]
        
        switch currentQuestion.type {
        case .single:
            singleStackView.isHidden = false
        case .multiple:
            multipleStackView.isHidden = false
        case .ranged:
            rangedStackView.isHidden = false
        }
    }
    


    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
