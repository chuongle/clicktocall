//
//  ViewController.swift
//  clicktocall-swift
//
//  Created by Chuong Le on 6/30/17.
//  Copyright © 2017 Poetic Systems. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var callButton: UIButton!
    @IBOutlet weak var phoneInput: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        phoneInput.keyboardType = UIKeyboardType.numberPad
        // for hitting return
        phoneInput.delegate = self
        // for tapping
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(ViewController.dismissKeyboard)))

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func placeCall(_ sender: UIButton) {
        UIApplication.shared.open(URL(string: "tel://" + phoneInput.text!)!, options: [:], completionHandler: nil)
    }
    
    // for tapping
    func dismissKeyboard() {
        phoneInput.resignFirstResponder()
    }
    
    // for hitting return
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        phoneInput.resignFirstResponder()
        return true
    }
    
}

