//
//  conditionViewController.swift
//  openDeposit
//
//  Created by Михаил on 30.07.2021.
//

import UIKit



class SelectProducViewController: UIViewController {
    
    let depositConditions = Offer.getDepositConditions()
    
    @IBOutlet weak var productViewOU: UIView!
    @IBOutlet weak var depositNameTitleOU: UILabel!
    @IBOutlet weak var depositNameSubtitleOU: UILabel!
    @IBOutlet weak var PercentRateTitleOU: UILabel!
    @IBOutlet weak var percentRateSubtitleOU: UILabel!
    
    @IBOutlet weak var imageSumOU: UIImageView!
    @IBOutlet weak var titleSumOU: UILabel!
    @IBOutlet weak var subtitleSumOU: UILabel!
    
    
    @IBOutlet weak var imageCapitalizationOU: UIImageView!
    @IBOutlet weak var titleCapitalizationOU: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        depositNameTitleOU.text = depositConditions.offerName
        depositNameSubtitleOU.text = currencyTitleFormatter()
        
        productViewOU.layer.cornerRadius = productViewOU.frame.width / 17
        PercentRateTitleOU.text = "до \(depositConditions.conditions[2].interest)%"
        
    }
}

extension SelectProducViewController {
    
    private func currencyTitleFormatter() -> String {
        
        var depositIn = ""
        
        switch depositConditions.currency.code {
        
        case 810:
            depositIn = "В рублях"
        default:
            depositIn = ""
        }
        return depositIn
    }
    
//    private func searchMaxPercenrRate() -> Int {
//
//        var min: Int
//        var max:Int
//
//        for i in 0..<depositConditions.conditions.count {
//            if depositConditions.conditions[i] < min {
//                min = arr[i]
//            }
//
//            if arr[i] > max {
//                max = arr[i]
//            }
//
//        }
    }

