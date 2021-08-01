//
//  OpeningDepositViewController.swift
//  openDeposit
//
//  Created by Дмитрий Нечаев on 31.07.2021.
//

import UIKit

class OpeningDepositViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    static var opeDepVC = OpeningDepositViewController()
    
    //MARK: - Private properties
    
    //Создаю таблицу
    private var depositSettingsTableView = UITableView()
    private let cellID = "defaultCell"
    private let depositAmount = 0
    
    
    //Создаю кнопку и инкапсулирую ее внутренности
    private let continueButton: UIButton = {
        
        let continueButton = UIButton(type: .roundedRect)
        
        continueButton.translatesAutoresizingMaskIntoConstraints = false
        continueButton.backgroundColor = #colorLiteral(red: 0, green: 0.4509803922, blue: 1, alpha: 1)
        continueButton.titleLabel?.text = "Продолжить"
        continueButton.setTitle("Продолжить", for: .normal)
        continueButton.setTitleColor(.white, for: .normal)
        continueButton.layer.cornerRadius = 10
        
        return continueButton
    }()
    
    //MARK: - Override methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //создаю таблицу (описание функции ниже)
        createTable()
        
        //Добавляю кнопку на экран
        view.addSubview(continueButton)
        
        //Устанавливаю созданные ниже констрейнты для кнопки
        addconstraints()
        
        continueButton.addTarget(self, action: #selector(buttonIsTapped(sender:)), for: .touchUpInside)
        }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let dvc = segue.destination as? ConfirmationViewController else { return }
        dvc.nameOfDeposit = "\(Deposit.offer.offerName)"
        dvc.currency = "\(Deposit.offer.currency.charCode)"
        dvc.sumOfDeposit = FieldTableViewCell.myFieldcell.textForDrop
        dvc.depositTerb = MyTableViewCell.tableCell.textForDrop
        dvc.procent = "5"
    }
    
    //MARK:- Public methods
    
    @objc func buttonIsTapped(sender: UIButton) {
        performSegue(withIdentifier: "detailSegue", sender: nil)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 2 {
            
            let fieldCell = tableView.dequeueReusableCell(withIdentifier: FieldTableViewCell.identifier, for: indexPath) as! FieldTableViewCell
            return fieldCell
            
        } else if indexPath.row == 3{
            
            let customCell = tableView.dequeueReusableCell(withIdentifier: MyTableViewCell.identifier, for: indexPath) as! MyTableViewCell
            customCell.confugure(value: 30, text: "дней")
            
            return customCell
            
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        var content = cell.defaultContentConfiguration()
        
        
        switch indexPath.row {
        case 0:
            content.text = Deposit.offer.offerName
            content.secondaryText = "Название вклада"
            cell.contentConfiguration = content
            return cell
        case 1:
            content.text = Deposit.offer.currency.charCode
            content.secondaryText = "Валюта"
            cell.contentConfiguration = content
            return cell
        default:
            content.text = "\(Deposit.offer.conditions[0].interest)"
            content.secondaryText = "Процентная ставка"
            cell.contentConfiguration = content
            return cell
        }

    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row != 3 {
            return 60
        } else {
            return 100
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        view.endEditing(true)
    }
    
    //MARK: - Private methods
    
    //Расставляю констрейнты кнопки
    private func addconstraints () {
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
        
        //Добавляю таблицу (Можно констрейнты прибить по нулям, но данный способ проще)
        depositSettingsTableView = UITableView(frame: view.bounds, style: .grouped)
        depositSettingsTableView.backgroundColor = .white
        depositSettingsTableView.delegate = self
        depositSettingsTableView.dataSource = self
        depositSettingsTableView.keyboardDismissMode = .onDrag
        
        //подключаю свои xib-ы
        depositSettingsTableView.register(MyTableViewCell.nib(), forCellReuseIdentifier: MyTableViewCell.identifier)
        depositSettingsTableView.register(FieldTableViewCell.nib(), forCellReuseIdentifier: FieldTableViewCell.identifier)
        
        //Маски (они растягивают таблицу)
        depositSettingsTableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        depositSettingsTableView.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
        view.addSubview(depositSettingsTableView)
    }
    
    
}

