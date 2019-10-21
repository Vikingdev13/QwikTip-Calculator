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
    @IBOutlet weak var stepperCountLabel: UILabel!
    @IBOutlet weak var amountPerParty: UILabel!
    @IBOutlet weak var tipPerParty: UILabel!
    
    
    
    // MARK: - Actions
    @IBAction func stepperPressed(_ sender: UIStepper) {
        
        stepperCountLabel.text = Int(sender.value).description
        model.stepperCountLabel = Int(sender.value)
        
        updateLabels()
    }
    
    @IBAction func showAlert(_ sender: Any) {
        let alertController = UIAlertController(title: "Welcome to the Qwik Tip Calculator", message: "1. Enter your bill subtotal, then push done.\n2. Next, use the slider for tip percent, and if you need to split the bill, press the + button for party size.", preferredStyle: .alert)
        
        alertController.addAction(UIAlertAction(title: "Got it!", style: .default))
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    
    
    
    // MARK: - Properties
    let model = Model()

   
    // MARK: - Interactions
    @IBAction func dragSlider(_ sender: UISlider) {
        tipPercentLabel.text = "Tip (\(Int(sender.value))%):"
        
        model.tipPercentFromSlider = Int(sender.value)
        updateLabels()
        
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
        
        if subtotalTextField.text?.count == 0 {
            subtotalTextField.text = "0.00"
            model.subtotalFromTextField = "0"
            updateLabels()
        } else {
            model.subtotalFromTextField = subtotalTextField.text!
            model.tipPercentFromSlider = Int(tipPercentSlider.value)
            
            // Update Labels
            updateLabels()
            
        }
        
        
        
    }
    
    func updateLabels() {
        subtotalTextField.text = model.subtototalAsCurrency
        tipAmountLabel.text = model.tipAmountAsCurrency
        totalAmountLabel.text = model.totalAmountAsCurrency
        amountPerParty.text = model.amountPerPartyAsCurrency
        tipPerParty.text = model.tipPerPartyAsCurrency
        
        
        
        
    }
    
    
    
    
    
} // END

