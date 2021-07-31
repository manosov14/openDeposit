//
//  ClientInfo.swift
//  openDeposit
//
//  Created by Михаил on 30.07.2021.
//

//ебаный миша ты можешь комментить, чтобы не копаться в этом 2 часа?

struct Client {
    let name: String
    let surname: String
    let products: [Product]
}

extension Client {
    static func getClientInfo() -> Client {
        Client(
            name: "Евгения",
            surname: "Бруйко",
            products: [
                Product(category: .card,
                        currency: Currency(
                            code: 810,
                            charCode: "₱"),
                        balance: Balance(
                            amount: 100000.55,
                            balanceForClient: "100 00$0.55 ₱")),
                Product(category: .card,
                        currency: Currency(
                            code: 978,
                            charCode: "€"),
                        balance: Balance(
                            amount: 2000.00,
                            balanceForClient: "2000 €"))
            ]
        )
    }
}
