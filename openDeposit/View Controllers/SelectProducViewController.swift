//
//  conditionViewController.swift
//  openDeposit
//
//  Created by Михаил on 30.07.2021.
//

import UIKit

class SelectProducViewController: UIViewController {
    
    let depositConditions: Deposit = Deposit.getDepositConditions()

    @IBOutlet weak var mainTitleOU: UILabel!
    
    @IBOutlet weak var subMainTitileOU: UILabel!
    
    @IBOutlet weak var mainLabel2OU: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
