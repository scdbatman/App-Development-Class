//
//  ViewController.swift
//  Calculator
//
//  Created by Samuel Bradshaw  on 1/24/25.
//
//save input to an array
//  check if input is special ie clear or equal
        //make calculation and update UI and array
//  else add input to array


//update user interface
//
import UIKit

class ViewController: UIViewController {
    @IBOutlet var calculationLabel: UILabel!
    @IBOutlet var calculationButtons: [UIButton]!
    @IBOutlet var clearButton: UIButton!
    
    var currentNumber = OperationInput(input: "", type: .number)
    var currentText: String = ""
    var savedInput = [OperationInput]()
    var lastInput = ""
    //    var currentCalculation: Double = 0
    //    var operationsToUse = []()
    //    var lastInput: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func calculationButtonPressed(_ sender: UIButton) {
        guard let uIText = sender.titleLabel?.text else {
            print("titleLabel text is nil")
            return
        }
        
        if uIText == "=" {

            print("Save number \(currentNumber)")
            savedInput.append(currentNumber)
            
            let result = makeCalculation()
            calculationLabel.text = result
            
            currentText = result
            currentNumber.input = result
            savedInput = [currentNumber]
            print("made calculation saved number \(savedInput)")
            
            clearButton.setTitle("AC", for: .normal)
            clearButton.titleLabel?.font = .systemFont(ofSize: 30)
        }else if uIText == "C" {
            if currentText.count > 0 {
                currentText.removeLast()
                calculationLabel.text = currentText
                
                currentNumber.input.removeLast()
                
            }else {
                clearButton.setTitle("AC", for: .normal)
                clearButton.titleLabel?.font = .systemFont(ofSize: 30)
            }
        }else if uIText == "AC" {
                currentText = ""
                calculationLabel.text = ""
                currentNumber.input = ""
                savedInput = [currentNumber]
            print(savedInput)
        }else if uIText == "+" || uIText == "-" || uIText == "/" || uIText == "X" {
            currentText.append(uIText)
            calculationLabel.text = currentText

            print("Save number \(currentNumber)")
            savedInput.append(currentNumber)
            
            currentNumber.input = uIText
            currentNumber.type = .operation
            print("Save operator \(currentNumber)")
            savedInput.append(currentNumber)
            
            currentNumber.input = ""
            currentNumber.type = .number
            print("saved stuff \(savedInput)")
            
            lastInput = uIText
            
        }else {
            currentText.append(uIText)
            calculationLabel.text = currentText
            currentNumber.input += uIText
            currentNumber.type = .number
            
            clearButton.setTitle("C", for: .normal)

            lastInput = uIText
        }
        
    }
    
    
    func makeCalculation() -> String {
        guard var result = Double(savedInput[0].input) else{
            calculationLabel.text = "error with saved input"
            return "error"
        }
        var currentOperator = ""
        
        for values in savedInput {
            if values.type == .operation {
                currentOperator = values.input
                
            } else if values.type == .number {
                guard let number = Double(values.input) else{
                    calculationLabel.text = "error with saved input"
                    return "error"
                }
                
                switch currentOperator {
                case "+" :
                    result += number
                case "-" :
                    result -= number
                case "/" :
                    result /= number
                case "X" :
                    result *= number
                default :
                    break
                }//end of switch
            }//end of else if number or operator
        }//end of for
        return String(result)
    }//end of make calculation
    
    
    
    
}//end of view controller


struct OperationInput {
    enum Operation {
        case number, operation
    }
    var input: String
    var type: Operation
    
}
func updateUI() {
    
}
//        guard let titleLabel = sender.titleLabel?.text else {
//            print("titleLabel text is nil")
//            return
//        }
//        if titleLabel == "=" {
//            saveCurrentNumber()
//            currentNumber = [String(makeCalculation())]
//            currentText = currentNumber
//            updateUI()
//            clearButton.titleLabel?.text = "AC"
//        
//        }else if titleLabel == "AC" {
//            resetCalculation()
//            updateUI()
//        }else if titleLabel == "C" {
//            clearLastInput()
//            
//            updateUI()
//        }else if titleLabel == "+" || titleLabel == "-" || titleLabel == "/" || titleLabel == "X"{
//            currentNumber.input += titleLabel
//            currentNumber.type = .operation
//            
//            updateUI()
//        }else{
//            currentNumber.input += titleLabel
//            currentNumber.type = .number
//            currentText.append(titleLabel)
//            lastInput = titleLabel
//            updateUI()
//            clearButton.titleLabel?.text = "C"
//        }//end of if titlelabel is operator
//        
//    }//end of IBAction
//    
//    func updateUI() {
//        let calculationString: String = currentText.joined()
//        calculationLabel.text = calculationString
//    }//end of makeNumbersText
//    
//    func makeCalculation() -> Double {
//        var total = 0.0
//        
//        for operands in currentNumber.input {
//            if currentNumber.type == .operation {
//                
//            }
//        }
//        var iteration: Int = 0
//        currentCalculation = numbersToUse[0]
//        for _ in numbersToUse {
//            if iteration != numbersToUse.count - 1 {
//                let currentOperator = operatorsToUse[iteration]
//                print("\(operatorsToUse[iteration]) operator")
//                switch currentOperator {
//                case "+":
//                    currentCalculation = currentCalculation + numbersToUse[iteration + 1]
//                case "-":
//                    currentCalculation = currentCalculation - numbersToUse[iteration + 1]
//                case "/":
//                    currentCalculation = currentCalculation / numbersToUse[iteration + 1]
//                case "X":
//                    currentCalculation = currentCalculation * numbersToUse[iteration + 1]
//                default: currentCalculation = 69.6969
//                }//end of switch
//                print("iteration \(iteration)")
//                iteration += 1
//            }else {
//                currentCalculation = ((currentCalculation * 1000).rounded() / 1000)
//                print("Result \(currentCalculation)")
//                numbersToUse = []
//                operatorsToUse = []
//                return currentCalculation
//            }//end of if
//        }//end of for
//        return 0
//}//end of make calculation
    
//    func saveCurrentNumber() {
//        print("\(currentNumber) current number")
//        let doubleNumber = currentNumber.joined()
//        if let savedNumber = Double(doubleNumber) {
//            numbersToUse.append(Double(savedNumber))
//            currentNumber = []
//            print("\(numbersToUse) saved numbers")
//        }else {
//            print("error saving number")
//            
//        }
//    }
//    
//    func resetCalculation() {
//        numbersToUse = []
//        operatorsToUse = []
//        currentNumber = []
//        currentText = ["0"]
//    }
    
//    func setCurrentOperands() {
//        for operand in currentNumberText {
//            guard let number = Double(operand) else {
//                operatorsToUse.append(operand)
//            }
//            currentNumber.append(String(number))
//        }//end of for loop
//    }//end of func
   
//    func clearLastInput() {
//        if let character = Double(lastInput) {
//            numbersToUse.removeLast()
//            currentText.removeLast()
//        } else {
//            operatorsToUse.removeLast()
//            currentText.removeLast()
//        }
//    }//end of clearing input
//}//end of view controller
//



