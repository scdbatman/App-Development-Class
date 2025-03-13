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
    
    @IBOutlet var lastOperationLabel: UILabel!
    
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

            savedInput.append(currentNumber)
            
            print("before calculation saved input is \(savedInput)")
            let result = makeCalculation()
            calculationLabel.text = result
            lastOperationLabel.text = "\(stringOfInput(savedInput: savedInput)) = \(result)"
            currentText = result
            currentNumber.input = result
            savedInput = []
            
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
            savedInput.removeAll()
            lastOperationLabel.text = ""
            print(savedInput)
        }else if uIText == "+/-" {
            if let number = Double(currentNumber.input) {
                print(currentNumber.input)
                guard let range = currentText.range(of: polishResult(result: number), options: .backwards) else {
                    print("could not negate number")
                    return
                }
                currentNumber.input = String(number * -1)
                
                currentText.replaceSubrange(range, with: polishResult(result: number * -1))
                calculationLabel.text = currentText
                
            }
            
    }else if uIText == "%" {
        
        if let number = Double(currentNumber.input), currentNumber.type != .percentage {
                print(" before percent number is\(polishResult(result: number))")
                guard let range = currentText.range(of: polishResult(result: number), options: .backwards) else {
                    print("could not percent number")
                    return
                }
                if currentNumber.type != .percentage {
                    currentNumber.input = String(number / 100)
                    currentNumber.type = .percentage
                    
                    currentText.replaceSubrange(range, with: "\(polishResult(result: number))%")
                    calculationLabel.text = currentText
                }//end of if else percentage
                
                
            }//end of if let
        
        
    }else if uIText == "+" || uIText == "-" || uIText == "/" || uIText == "x" {
            currentText.append(uIText)
            calculationLabel.text = currentText

            savedInput.append(currentNumber)
            
            currentNumber.input = uIText
            currentNumber.type = .operation
            savedInput.append(currentNumber)
            
            currentNumber.input = ""
            currentNumber.type = .number
            
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
                case "x" :
                    result *= number
                default :
                    break
                }//end of switch
            }//end of else if number or operator
        }//end of for
        
        return polishResult(result: result)
    }//end of make calculation
    
    func polishResult(result: Double) -> String {
        if result < 0.0001 && result > -0.0001{
            
            return "0"
        }
        let roundedResult = (result * 10_000).rounded() / 10_000
        
        if roundedResult.truncatingRemainder(dividingBy: 1) == 0 {
            return String(format: "%.0f", roundedResult)
        }else {
            return String(roundedResult)
        }
    }//end of polishResult
    
    func stringOfInput(savedInput: [OperationInput]) -> String {
        var stringInput = ""
        for inputs in savedInput {
            if let number = Double(inputs.input) {
                stringInput += polishResult(result: number)
                stringInput += " "
            }else {
                stringInput += inputs.input
                stringInput += " "
            }//if else input is a number
        }//end of for loop
        
        return stringInput
    }//end of string of input
    
}//end of view controller


struct OperationInput {
    enum Operation {
        case number, operation, percentage
    }
    var input: String
    var type: Operation
    
}
func updateUI() {
    
}


