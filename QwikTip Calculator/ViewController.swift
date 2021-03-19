//
//  ViewController.swift
//  QwikTip Calculator
//
//  Created by John Piccione on 9/30/19.
//  Copyright © 2019 John Piccione. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: - View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        subtotalTextField.becomeFirstResponder()
        createToolbar()
        tipPercentSlider.isEnabled = false
        
        
        
    }
    
    
    // MARK: - Outlets
    @IBOutlet weak var subtotalTextField: UITextField!
    @IBOutlet weak var tipPercentLabel: UILabel!
    @IBOutlet weak var tipPercentSlider: UISlider!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var totalAmountLabel: UILabel!
    @IBOutlet weak var stepperCountLabel: UIStepper!
    @IBOutlet weak var amountPerParty: UILabel!
    @IBOutlet weak var tipPerParty: UILabel!
    
    
    // Mark: - Variables
    
    
    
    
    // MARK: - Actions
    @IBAction func stepperPressed(_ sender: UIStepper) {
        stepperCountLabel = Int(sender.value).description
        
    }
    
    @IBAction func showAlert(_ sender: Any) {
        let alertController = UIAlertController(title: "Welcome to the Qwik Tip Calculator",
                                            message: "1. Enter your bill subtotal, then push done.\n2. Next, use the slider for tip percent(default is 15%). \n3. Lastly, if you need to split the bill, press the + button to adjust party size.", preferredStyle: .alert)
        
        alertController.addAction(UIAlertAction(title: "Got it!", style: .default))
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    
    
    
    
    

   
    // MARK: - Interactions
    @IBAction func dragSlider(_ sender: UISlider) {
        tipPercentLabel.text = "Tip (\(Int(sender.value))%):"
        
               
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        tipPercentSlider.isEnabled = false
        
        
    }
    
   
    
    
    
    // MARK: - Functions
    
    func createToolbar() {
        let toolbar = UIToolbar()
        toolbar.barStyle = .default
        toolbar.sizeToFit()
        
        // create bar button items
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissKeyboard))
        
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        
        // add items to toolbar
        toolbar.setItems([flexibleSpace, doneButton], animated: true)
        
        
        // add toolbar to keyboard
        subtotalTextField.inputAccessoryView = toolbar
        
    }
    
    @objc func dismissKeyboard() {
        subtotalTextField.resignFirstResponder()
        tipPercentSlider.isEnabled = true
        
    }
        
    
    
    
} // END

