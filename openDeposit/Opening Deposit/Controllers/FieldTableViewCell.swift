//
//  FieldTableViewCell.swift
//  openDeposit
//
//  Created by Дмитрий  on 01.08.2021.
//

import UIKit

class FieldTableViewCell: UITableViewCell, UITextFieldDelegate {
    
    static let myFieldcell = FieldTableViewCell()
    
    static let identifier = "FieldTableViewCell"
    static func nib() -> UINib {
        return UINib(nibName: "FieldTableViewCell", bundle: nil)
    }
    
    var textForDrop = "Not Found"
    
    @IBOutlet var field: UITextField!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        field.placeholder = "Cумма депозита"
        field.borderStyle = .none
        field.delegate = self
        field.keyboardType = .numberPad
        field.keyboardAppearance = .light
        
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if Int(textField.text!) != nil {
            textForDrop = textField.text!
        } else {
            textField.text = ""
            textField.attributedPlaceholder = NSAttributedString(string: "Введите целое число!", attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])
        }
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        textField.placeholder = "Cумма депозита"
        textField.attributedPlaceholder = NSAttributedString(string: "Введите cумму депозита", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
}
