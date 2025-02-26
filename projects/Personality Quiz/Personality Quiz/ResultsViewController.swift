//
//  ResultsViewController.swift
//  Personality Quiz
//
//  Created by Samuel Bradshaw  on 2/25/25.
//

import UIKit

class ResultsViewController: UIViewController {
    
    
    @IBOutlet var resultAnswerLabel: UILabel!
    
    @IBOutlet var resultDefinitionLabel: UILabel!
    
    var responses: [Answer]
    
    init?(coder: NSCoder, responses: [Answer]) {
        self.responses = responses
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        calculatePersonalityResults()
        navigationItem.hidesBackButton = true
        // Do any additional setup after loading the view.
    }
    
  
    func calculatePersonalityResults(){
        
        let frequencyOfAnswers = responses.reduce(into: [Answer.BenderType: Int]()) { (counts, answer) in
            if let existingCount = counts[answer.type] {
                counts[answer.type] = existingCount + 1
            }else {
                counts[answer.type] = 1
            }
        }
                                          
          let mostCommonAnswers = frequencyOfAnswers.sorted {
                $0.1 > $1.1 }.first!.key
        resultAnswerLabel.text = "You are a \(mostCommonAnswers.rawValue) bender"
        resultDefinitionLabel.text = mostCommonAnswers.definition
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
