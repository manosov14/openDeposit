//
//  OpeningDepositViewController.swift
//  openDeposit
//
//  Created by Дмитрий Нечаев on 31.07.2021.
//

import UIKit

class OpeningDepositViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    //MARK: - Private properties
    
    //Создаю таблицу
    private var depositSettingsTableView = UITableView()
    private let cellID = "defaultCell"
    
    
    //Создаю кнопку и инкапсулирую ее внутренности
    private let continueButton: UIButton = {
        
        let continueButton = UIButton(type: .roundedRect)
        
        continueButton.translatesAutoresizingMaskIntoConstraints = false
        continueButton.backgroundColor = .blue
        continueButton.titleLabel?.text = "Продолжить"
        continueButton.setTitle("Продолжить", for: .normal)
        continueButton.setTitleColor(.white, for: .normal)
        continueButton.layer.cornerRadius = 4
        
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

    }
    
    //MARK:- Public methods
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        cell.textLabel?.text = "\(indexPath.section)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        60
    }
    
    //MARK: - Private methods
    
    //Расставляю ее констрейнты
    private func addconstraints () {
        var constraints = [NSLayoutConstraint]()
        
        //Добавление констрейнтов для кнопки
        
        constraints.append(continueButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16))
        constraints.append(continueButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16))
        constraints.append(continueButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -44))
        constraints.append(continueButton.heightAnchor.constraint(equalToConstant: 60))
        
        //Активация
        NSLayoutConstraint.activate(constraints)
    }
    
    private func createTable() {
        
        //Добавляю таблицу (Можно констрейнты прибить по нулям, но данный способ проще)
        depositSettingsTableView = UITableView(frame: view.bounds, style: .grouped)
        depositSettingsTableView.delegate = self
        depositSettingsTableView.dataSource = self
        
        //Маски (они растягивают таблицу)
        depositSettingsTableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        depositSettingsTableView.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
        view.addSubview(depositSettingsTableView)
    }
    
    
}

