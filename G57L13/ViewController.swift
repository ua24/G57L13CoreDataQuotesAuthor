//
//  ViewController.swift
//  G57L13
//
//  Created by Ivan Vasilevich on 11/7/17.
//  Copyright © 2017 RockSoft. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
	@IBOutlet weak var emailTextField: UITextField!
	private var realSpeed = 245
	
	var speed: Int { // from 0 to 255
		set {
			self.realSpeed = max( min(newValue, 255), max(0, newValue))
		}
		
		get {
			return realSpeed
		}
	}
	
	override func awakeFromNib() {
		super.awakeFromNib()
		speed = 244
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		emailTextField.delegate = self
	}

	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		let number = Int(arc4random()%2000) - 1000
		print(number)
		speed = number
		print(speed)
	}
	
	// MARK: - textFieldDelegate
	func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
		if emailValid(emailTextField.text!) {
			view.backgroundColor = .green
		}
		else {
			view.backgroundColor = .red
		}
		return true
	}
	
	func emailValid(_ email: String) -> Bool {
		let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
		
		let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
		return emailTest.evaluate(with: email)
		
		
	}


}

