//
//  ViewController.swift
//  calculator
//
//  Created by Jeff on 2018-07-01.
//  Copyright © 2018 Jeff. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var numberOnScreen:Double = 0
    var previousNumber:Double = 0
    var performMath = false
    var operation = 0;
    @IBOutlet weak var label: UILabel!
    
    @IBAction func numbers(_ sender: UIButton) {
        if performMath == true
        {
            label.text = String(sender.tag - 1)
            numberOnScreen = Double(label.text!)!
            performMath = false
        }
        else
        {
        label.text = label.text! + String(sender.tag - 1)
        numberOnScreen = Double(label.text!)!
        }
    }
    
    @IBAction func mathnumbers(_ sender: UIButton) {
        if (label.text != "" && sender.tag != 11 && sender.tag != 16)
        {
            previousNumber = Double(label.text!)!
            if sender.tag == 12 //Divide
            {
                label.text = "/"
            }
            else if sender.tag == 13 //Multiply
            {
                label.text = "x"
            }
            else if sender.tag == 14 //Subtract
            {
                label.text = "-"
            }
            else if sender.tag == 15 //Add
            {
                label.text = "+"
            }
            operation = sender.tag
            performMath = true
        }
        else if(sender.tag == 16)
        {
            if operation == 12
            {
                label.text = String(previousNumber / numberOnScreen)
            }
            else if operation == 13
            {
                label.text = String(previousNumber * numberOnScreen)
            }
            else if operation == 14
            {
                label.text = String(previousNumber - numberOnScreen)
            }
            else if operation == 15
            {
                label.text = String(previousNumber + numberOnScreen)
            }
        }
        else if(sender.tag == 11)
        {
            label.text = ""
            previousNumber = 0
            numberOnScreen = 0
            operation = 0
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

