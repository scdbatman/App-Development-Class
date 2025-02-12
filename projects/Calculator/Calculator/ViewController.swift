//
//  ViewController.swift
//  Calculator
//
//  Created by Samuel Bradshaw  on 1/24/25.
//

import UIKit

class ViewController: UIViewController {
    var currentNumber = [String]()
    var currentText = [String]()
    var currentCalculation: Double = 0
    var numbersToUse = [Double]()
    var operatorsToUse = [String]()
    var lastInput: String = ""
    @IBOutlet var calculationLabel: UILabel!
    @IBOutlet var calculationButtons: [UIButton]!
    @IBOutlet var clearButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func calculationButtonPressed(_ sender: UIButton) {
        
        guard let titleLabel = sender.titleLabel?.text else {
            print("titleLabel text is nil")
            return
        }
        if titleLabel == "=" {
            saveCurrentNumber()
            currentNumber = [String(makeCalculation())]
            currentText = currentNumber
            updateUI()
            clearButton.titleLabel?.text = "AC"
        }else if titleLabel == "+" || titleLabel == "-" || titleLabel == "/" || titleLabel == "X"{
            saveCurrentNumber()
            operatorsToUse.append(titleLabel)
            currentText.append(titleLabel)
            lastInput = titleLabel
            updateUI()
        }else if titleLabel == "AC" {
            resetCalculation()
            updateUI()
        }else if titleLabel == "C" {
            clearLastInput()
            
            updateUI()
        }else{
            currentNumber.append(titleLabel)
            currentText.append(titleLabel)
            lastInput = titleLabel
            updateUI()
            clearButton.titleLabel?.text = "C"
        }//end of if titlelabel is operator
        
    }//end of IBAction
    
    func updateUI() {
        let calculationString: String = currentText.joined()
        calculationLabel.text = calculationString
    }//end of makeNumbersText
    
    func makeCalculation() -> Double {
        
        var iteration: Int = 0
        currentCalculation = numbersToUse[0]
        for _ in numbersToUse {
            if iteration != numbersToUse.count - 1 {
                let currentOperator = operatorsToUse[iteration]
                print("\(operatorsToUse[iteration]) operator")
                switch currentOperator {
                case "+":
                    currentCalculation = currentCalculation + numbersToUse[iteration + 1]
                case "-":
                    currentCalculation = currentCalculation - numbersToUse[iteration + 1]
                case "/":
                    currentCalculation = currentCalculation / numbersToUse[iteration + 1]
                case "X":
                    currentCalculation = currentCalculation * numbersToUse[iteration + 1]
                default: currentCalculation = 69.6969
                }//end of switch
                print("iteration \(iteration)")
                iteration += 1
            }else {
                currentCalculation = ((currentCalculation * 1000).rounded() / 1000)
                print("Result \(currentCalculation)")
                numbersToUse = []
                operatorsToUse = []
                return currentCalculation
            }//end of if
        }//end of for
        return 0
    }//end of make calculation
    
    func saveCurrentNumber() {
        print("\(currentNumber) current number")
        let doubleNumber = currentNumber.joined()
        if let savedNumber = Double(doubleNumber) {
            numbersToUse.append(Double(savedNumber))
            currentNumber = []
            print("\(numbersToUse) saved numbers")
        }else {
            print("error saving number")
            
        }
    }
    
    func resetCalculation() {
        numbersToUse = []
        operatorsToUse = []
        currentNumber = []
        currentText = ["0"]
    }
    
//    func setCurrentOperands() {
//        for operand in currentNumberText {
//            guard let number = Double(operand) else {
//                operatorsToUse.append(operand)
//            }
//            currentNumber.append(String(number))
//        }//end of for loop
//    }//end of func
   
    func clearLastInput() {
        if let character = Double(lastInput) {
            numbersToUse.removeLast()
            currentText.removeLast()
        } else {
            operatorsToUse.removeLast()
            currentText.removeLast()
        }
    }//end of clearing input
}//end of view controller


struct OperationInput {
    enum operation {
        case number, operation
    }
    var inputType: String
    var operand: operation
}


