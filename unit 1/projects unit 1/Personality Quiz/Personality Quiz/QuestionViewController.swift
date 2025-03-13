//
//  QuestionViewController.swift
//  Personality Quiz
//
//  Created by Samuel Bradshaw  on 2/25/25.
//

import UIKit

class QuestionViewController: UIViewController {
    
    @IBOutlet var questionLabel: UILabel!
    
    
    @IBOutlet var rangedStackView: UIStackView!
    @IBOutlet var rangedLabel1: UILabel!
    @IBOutlet var rangedLabel2: UILabel!
    @IBOutlet var rangedSlider: UISlider!
    
    @IBOutlet var singleStackView: UIStackView!
    @IBOutlet var singleButton1: UIButton!
    @IBOutlet var singleButton2: UIButton!
    @IBOutlet var singleButton4: UIButton!
    @IBOutlet var singleButton3: UIButton!
    
    @IBOutlet var multipleStackView: UIStackView!
    @IBOutlet var multipleLabel1: UILabel!
    @IBOutlet var multipleLabel2: UILabel!
    @IBOutlet var multipleLabel3: UILabel!
    @IBOutlet var multipleLabel4: UILabel!
    @IBOutlet var multipleSwitch1: UISwitch!
    @IBOutlet var multipleSwitch2: UISwitch!
    @IBOutlet var multipleSwitch3: UISwitch!
    @IBOutlet var multipleSwitch4: UISwitch!
    
    @IBOutlet var questionProgressView: UIProgressView!
    
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
            answers: [Answer(text: "I like to relax inside", type: .water),
                      Answer(text: "ADRENALINE", type: .earth),
                      Answer(text: "I enjoy being active in nature", type: .fire),
                      Answer(text: "I enjoy being active in nature", type: .air),

            ]
        ),
        Question(
            text: "If you won a million dollars what would you do?",
            type: .multiple,
            answers: [Answer(text: "Start a business", type: .water),
                      Answer(text: "Donate to charity", type: .air),
                      Answer(text: "Travel the world", type: .earth),
                      Answer(text: "We're going to Vegas", type: .fire)
                      
            ]
        ),
        Question(
            text: "Someone just insulted you.",
            type: .ranged,
            answers: [Answer(text: "Who cares?", type: .water),
                      Answer(text: "Donate to charity", type: .air),
                      Answer(text: "Travel the world", type: .earth),
                      Answer(text: "Fight them!", type: .fire),
            ]
        ),
    ]
    
    var questionIndex = 0
    var answerChosen: [Answer] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func singleAnswerButtonPressed(_ sender: UIButton) {
        let currentAnswers = questions[questionIndex].answers
        
        switch sender {
        
        case singleButton1:
            answerChosen.append(currentAnswers[0])
        case singleButton2:
            answerChosen.append(currentAnswers[1])
        case singleButton3:
            answerChosen.append(currentAnswers[2])
        case singleButton4:
            answerChosen.append(currentAnswers[3])
        default:
            break
        }
        nextQuestion()
    }
    
    @IBAction func multipleButtonPressed() {
        let currentAnswers = questions[questionIndex].answers
        
        if multipleSwitch1.isOn {
            answerChosen.append(currentAnswers[0])
        }
        if multipleSwitch2.isOn {
            answerChosen.append(currentAnswers[1])
        }
        if multipleSwitch3.isOn {
            answerChosen.append(currentAnswers[2])
        }
        if multipleSwitch4.isOn {
            answerChosen.append(currentAnswers[3])
        }
        
        nextQuestion()
    }
    
    @IBAction func rangedButtonPressed() {
        let currentAnswers = questions[questionIndex].answers
        let index = Int(round(rangedSlider.value * Float(currentAnswers.count - 1)))
        answerChosen.append(currentAnswers[index])
        nextQuestion()
    }
    
    func updateUI() {
        singleStackView.isHidden = true
        multipleStackView.isHidden = true
        rangedStackView.isHidden = true
        
        let currentQuestion = questions[questionIndex]
        let currentAnswers = currentQuestion.answers
        let totalProgress = Float(questionIndex) / Float(questions.count)
        
        navigationItem.title = "Question #\(questionIndex + 1)"
        questionLabel.text = currentQuestion.text
        questionProgressView.setProgress(totalProgress, animated: true)
        
        switch currentQuestion.type {
        case .single:
            updateSingleStack(using: currentAnswers)
        case .multiple:
            updateMultipleStack(using: currentAnswers)
        case .ranged:
            updateRangedStack(using: currentAnswers)
        }
    }
    
    func nextQuestion(){
        questionIndex += 1
        if questionIndex < questions.count {
            updateUI()
        }else {
            performSegue(withIdentifier: "Results", sender: nil)
        }
    }
    
    @IBSegueAction func showResults(_ coder: NSCoder) -> ResultsViewController? {
        return ResultsViewController(coder: coder, responses: answerChosen)
    }
    func updateRangedStack(using answers: [Answer]){
        rangedStackView.isHidden = false
        rangedSlider.setValue(0.5, animated: false)
        rangedLabel1.text = answers.first?.text
        rangedLabel2.text = answers.last?.text
    }
    func updateSingleStack(using answers: [Answer]){
        singleStackView.isHidden = false
        singleButton1.setTitle(answers[0].text, for: .normal)
        singleButton2.setTitle(answers[1].text, for: .normal)
        singleButton3.setTitle(answers[2].text, for: .normal)
        singleButton4.setTitle(answers[3].text, for: .normal)
    }
    func updateMultipleStack(using answers: [Answer]){
        multipleStackView.isHidden = false
        multipleSwitch1.isOn = false
        multipleSwitch2.isOn = false
        multipleSwitch3.isOn = false
        multipleSwitch4.isOn = false
        multipleLabel1.text = answers[0].text
        multipleLabel2.text = answers[1].text
        multipleLabel3.text = answers[2].text
        multipleLabel4.text = answers[3].text
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
