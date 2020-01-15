//
//  ViewController.swift
//  RomanNumeralConverter
//
//  Created by Fabio Quintanilha on 1/14/20.
//  Copyright © 2020 FabioQuintanilha. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var inputTextField: UILabel!
    @IBOutlet weak var outputLabel: UILabel!
    @IBOutlet var romanKeysButton: [UIButton]!
    
    var romanString = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.outputLabel.text = ""
        self.inputTextField.text = ""
    }

    @IBAction func romanKeyPressed(_ sender: UIButton) {
        if sender.tag == 7 {
            _ = romanString.popLast()
        } else if sender.tag == 8 {
            if !romanString.isEmpty {
                let romanNumber = RomanNumeral(romanNumber: romanString.joined()).getDecimalValue()!
                self.outputLabel.text = "\(romanNumber)"
            } else {
                self.outputLabel.text = ""
            }
        } else {
            romanString.append(sender.titleLabel!.text!)
        }
        inputTextField.text = romanString.joined()
    }
}

