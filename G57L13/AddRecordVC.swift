//
//  AddRecordVC.swift
//  G57L12
//
//  Created by Ivan Vasilevich on 11/2/17.
//  Copyright © 2017 RockSoft. All rights reserved.
//

import UIKit
import CoreData

class AddRecordVC: UIViewController {

	@IBOutlet weak var textField: UITextField!
	@IBOutlet weak var authorPortretImageView: UIImageView!
	
	@IBAction func saveRecord() {
		
		let context = appDel.context
		let newQuote = Quote(context: context)
		newQuote.text = textField.text
		newQuote.dateAdded = Date()
		
		// Save the context.
		do {
			try context.save()
		} catch {
			// Replace this implementation with code to handle the error appropriately.
			// fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
			let nserror = error as NSError
			fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
		}
		
	}
	
	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		let pos = touches.first!.location(in: view)
		if authorPortretImageView.frame.contains(pos) {
			showImagePicker()
		}
	}
	
	func showImagePicker() {
		let picker = UIImagePickerController()
		picker.delegate = self
		present(picker, animated: true, completion: nil)
		
	}
}

extension AddRecordVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
	func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
		print(info)
		let img = info["UIImagePickerControllerOriginalImage"] as! UIImage
		authorPortretImageView.image = img
		picker.dismiss(animated: true, completion: nil)
		
	}
}
