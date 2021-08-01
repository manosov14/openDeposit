//
//  MyTableViewCell.swift
//  openDeposit
//
//  Created by Дмитрий  on 31.07.2021.
//

import UIKit

class MyTableViewCell: UITableViewCell {
    
    static let identifier = "MyTableViewCell"
    static func nib() -> UINib {
        return UINib(nibName: "MyTableViewCell", bundle: nil)
    }
    
    public func confugure(value: Int, text: String) {
        
        mySlider.minimumValue = 0
        mySlider.maximumValue = 100
        mySlider.minimumTrackTintColor = #colorLiteral(red: 0, green: 0.4509803922, blue: 1, alpha: 1)
        mySlider.thumbTintColor = #colorLiteral(red: 0, green: 0.4509803922, blue: 1, alpha: 1)
        mySlider.value = Float(value)
        myLabel.text = "\(Int(mySlider.value)) \(text)"
        myLabel.textColor = #colorLiteral(red: 0, green: 0.4509803922, blue: 1, alpha: 1)
       
    }
    
    @IBOutlet var mySlider: UISlider!
    @IBOutlet var myLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func changeValue(sender: UISlider) {
        
        //Гениальный алгоритм достойный премии лучшего Димасика на планете
        
        var daysFormat = "дней"
        
        var result = [String]()
        
        for item in String(Int(sender.value)) {
            result.append(String(item))
            
            switch result.last {
            
            case "0", "5", "6", "7", "8", "9":
                daysFormat = "дней"
            
            case "1":
                daysFormat = "день"
                
            default:
                daysFormat = "дня"
            }
            result.removeLast()
        }
            
        
        myLabel.text = "\(Int(sender.value)) \(daysFormat)"
    }
    
}
