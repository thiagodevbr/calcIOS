//
//  ViewController.swift
//  calc
//
//  Created by Thiago Brito on 31/08/20.
//  Copyright © 2020 Thiago Brito. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var firstNumber: Float = 0
    var secondNumber: Float = 0
    var stringOperator: Character = "N" //N = nil
    var result: Float = 0
    var statusOperator: Bool = false
    
    @IBOutlet weak var numberBox: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    
    func setClear() {
        firstNumber=0
        secondNumber=0
        stringOperator="N"
        result = 0
        numberBox.text = "0"
    }
    
    func addNumber(number:Int){
        if numberBox.text=="0" && statusOperator==false {
            numberBox.text = String(number)
        } else if numberBox.text != "0" && statusOperator == false {
            numberBox.text = "\(numberBox.text!)\(String(number))"
        }
        
        if statusOperator == true {
            numberBox.text = String(number)
            statusOperator=false
        }
    }
    
    func operatorMath(operatorType: Character) {
        if numberBox.text == "0" {
            firstNumber = 0
        } else {
            if let valueBox = Float(numberBox.text!) {
               firstNumber = valueBox
            }
        }
        stringOperator = operatorType
        statusOperator = true
    }
    
    @IBAction func clearButton(_ sender: UIButton) {
        setClear()
    }
    
    @IBAction func oneButton(_ sender: UIButton) {
        addNumber(number: 1)
    }
    
    @IBAction func twoButton(_ sender: UIButton) {
        addNumber(number: 2)
    }
    
    @IBAction func threeButton(_ sender: UIButton) {
        addNumber(number: 3)
    }
    
    @IBAction func fourNumber(_ sender: UIButton) {
        addNumber(number: 4)
    }
    
    @IBAction func fiveNumber(_ sender: UIButton) {
        addNumber(number: 5)
    }
    
    @IBAction func sixNumber(_ sender: UIButton) {
        addNumber(number: 6)
    }
    
    @IBAction func sevenNumber(_ sender: UIButton) {
        addNumber(number: 7)
    }
    
    @IBAction func eightNumber(_ sender: UIButton) {
        addNumber(number: 8)
    }
    
    @IBAction func nineNumber(_ sender: UIButton) {
        addNumber(number: 9)
    }
    
    @IBAction func zeroButton(_ sender: UIButton) {
        addNumber(number: 0)
    }
    
    @IBAction func divButton(_ sender: UIButton) {
        operatorMath(operatorType: "/")
    }
    
    @IBAction func multButton(_ sender: UIButton) {
        operatorMath(operatorType: "*")
    }
    
    @IBAction func subButton(_ sender: UIButton) {
        operatorMath(operatorType: "-")
    }
    
    @IBAction func addButton(_ sender: UIButton) {
        operatorMath(operatorType: "+")
    }
    
    @IBAction func resultButton(_ sender: UIButton) {
        
        if firstNumber == 0 && secondNumber == 0 {
            result = 0
        } else if firstNumber != 0 && stringOperator != "N" && numberBox.text != "0" {
            if let valueBox = Float(numberBox.text!) {
               secondNumber = valueBox
            }
            
            if stringOperator == "/" {
                result = firstNumber / secondNumber
            } else if stringOperator == "*" {
                result = firstNumber * secondNumber
            } else if stringOperator == "-" {
                result = firstNumber - secondNumber
            } else {
                result = firstNumber + secondNumber
            }
            
            numberBox.text = String(result)
            firstNumber = result
            
        } else if firstNumber != 0 && secondNumber==0 {
            numberBox.text = "error"
        }
    }
}

