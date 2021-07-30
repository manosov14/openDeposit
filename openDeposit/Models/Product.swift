//
//  Product.swift
//  openDeposit
//
//  Created by Михаил on 30.07.2021.
//

struct Product {
    let category: Category
    let currency: Currency
    let balance: Balance
}

enum Category: String {
    case card = "Карта"
    case account = "Счет"
    case deposit = "Вклад"
}

struct Balance {
    let amount: Float
    let balanceForClient: String
}
