//
//  ConfirmationViewController.swift
//  openDeposit
//
//  Created by Дмитрий Нечаев on 01.08.2021.
//

import UIKit

class ConfirmationViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var nameOfDeposit: String!
    var currency: String!
    var sumOfDeposit: String!
    var depositTerb: String!
    var procent: String!
    
    var tableView = UITableView()
    
    private let continueButton: UIButton = {
        
        let continueButton = UIButton(type: .roundedRect)
        
        continueButton.translatesAutoresizingMaskIntoConstraints = false
        continueButton.backgroundColor = #colorLiteral(red: 0, green: 0.4509803922, blue: 1, alpha: 1)
        continueButton.titleLabel?.text = "Оформить вклад"
        continueButton.setTitle("Оформить вклад", for: .normal)
        continueButton.setTitleColor(.white, for: .normal)
        continueButton.layer.cornerRadius = 10
		continueButton.addTarget(self, action: #selector(continueButtonTaped), for: .touchUpInside)
        return continueButton
    }()
	
	@objc
		private func continueButtonTaped() {
			let storyboard = UIStoryboard(name: "ConfirmOtp", bundle: nil)
			let confirmOtp = storyboard.instantiateViewController(withIdentifier: "ConfirmOtp")
			confirmOtp.modalPresentationStyle = .fullScreen
			self.present(confirmOtp, animated: true)
		}

    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        createTable()
        view.addSubview(continueButton)
        
        addconstraints()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        9
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        var content = cell.defaultContentConfiguration()
        
        switch indexPath.row {
        case 0:
            content.text = nameOfDeposit
            content.secondaryText = "Название вклада"
            cell.contentConfiguration = content
        case 1:
            content.text = currency
            content.secondaryText = "Валюта"
            cell.contentConfiguration = content
        case 2:
            content.text = sumOfDeposit
            content.secondaryText = "Сумма вклада"
            cell.contentConfiguration = content
        case 3:
            content.text = depositTerb
            content.secondaryText = "Срок вклада"
            cell.contentConfiguration = content
        case 4:
            content.text = procent
            content.secondaryText = "Процентная ставка"
            cell.contentConfiguration = content
        case 5:
            content.text = "Нет"
            content.secondaryText = "Пополнение"
            cell.contentConfiguration = content
        case 6:
            content.text = "Нет"
            content.secondaryText = "Частичное снятие"
            cell.contentConfiguration = content
        case 7:
            content.text = "Да"
            content.secondaryText = "Пролонгация"
            cell.contentConfiguration = content
        default:
            content.text = "В конце срока"
            content.secondaryText = "Процентная ставка"
            cell.contentConfiguration = content
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
         60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        view.endEditing(true)
    }
    
    private func addconstraints() {
        var constraints = [NSLayoutConstraint]()
        
        //Добавление констрейнтов для кнопки
        
        constraints.append(continueButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20))
        constraints.append(continueButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20))
        constraints.append(continueButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -44))
        constraints.append(continueButton.heightAnchor.constraint(equalToConstant: 60))
        
        //Активация
        NSLayoutConstraint.activate(constraints)
    }
    
    
    private func createTable() {
        
        tableView = UITableView(frame: view.bounds, style: .grouped)
        tableView.backgroundColor = .white
        tableView.delegate = self
        tableView.dataSource = self
        tableView.keyboardDismissMode = .onDrag
        
        tableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        view.addSubview(tableView)
    }
    
  
}
