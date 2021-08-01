//
//  ConfirmOtpViewController.swift
//  openDeposit
//
//  Created by Сергей Ушаков on 01.08.2021.
//

import UIKit

class ConfirmOtpViewController: UIViewController {
	
	@IBOutlet weak var textFieldOutlet: UITextField!
	@IBOutlet weak var timerLable: UILabel!
	@IBAction func closeButton(_ sender: UIButton) {
		dismiss(animated: true)
	}
	
	// MARK: - Private properties
	
	private var timer: Timer?
	
	private var countDown = 4
	
	
	// MARK: - Life Cycle Methods
	override func viewDidLoad() {
		super.viewDidLoad()
		let tap = UITapGestureRecognizer(target: self, action: #selector(unKey))
		setupTimer()
		textFieldOutlet.delegate = self
		view.addGestureRecognizer(tap)
		view.isUserInteractionEnabled = true
	}
	
	// MARK: - Private Methods
	
	private func setupTimer() {
		timer = Timer.scheduledTimer(
			timeInterval: 1,
			target: self,
			selector: #selector(updateTimer),
			userInfo: nil,
			repeats: true
		)
	}
	
	// MARK: - Action
	
	@objc
	private func unKey() {
		view.endEditing(true)
	}
	
	@objc
	private func updateTimer() {
		if countDown < 1 {
			timer?.invalidate()
			timerLable.text = "Отправить код снова через 00:00"
		} else if countDown < 10 {
			timerLable.text = "Отправить код снова через 00:0\(countDown)"
		} else {
			timerLable.text = "Отправить код снова через 00:\(countDown)"
		}
		countDown -= 1
	}
}

// MARK: - UITextFieldDeligate

extension ConfirmOtpViewController: UITextFieldDelegate {
	func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
		if let text = textField.text,  let textRange = Range(range, in: text) {
			let updatedText = text.replacingCharacters(in: textRange, with: string)
			return updatedText.count < 5
		}
		return true
	}
}

