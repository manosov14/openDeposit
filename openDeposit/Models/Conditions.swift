//
//  Conditions.swift
//  openDeposit
//
//  Created by Михаил on 30.07.2021.
//

struct Deposit {
    let offers: [Offer]
}

struct Offer {
    let offerName: String
    let currency: Currency
    let isWithdrawal: Type
    let isReplenishable: Type
    let isProlongation: Type
    let isCapitalization: Type
    let conditions: [Conditions]
}

struct Conditions {
    let sumFrom: Int
    let sumTo: Int
    let interest: Int
}

extension Deposit {
    static func getDepositConditions() -> Deposit {
        Deposit(
            offers: [
                Offer(
                    offerName: "Вклад накопительный",
                    currency: Currency(
                        code: 810,
                        charCode: "₱"),
                    isWithdrawal: Type(
                        code: false,
                        name: "Без снятия"),
                    isReplenishable: Type(
                        code: false,
                        name: "Без снятия"),
                    isProlongation: Type(
                        code: true,
                        name: "Пролонгируемый"),
                    isCapitalization: Type(
                        code: true,
                        name: "Капитализация"),
                    conditions: [
                        Conditions(
                            sumFrom: 15000,
                            sumTo: 300000,
                            interest: 5),
                        Conditions(
                            sumFrom: 300000,
                            sumTo: 1000000,
                            interest: 6),
                        Conditions(
                            sumFrom: 1000000,
                            sumTo: 999999999,
                            interest: 7)
                    ]
                )
            ]
        )
    }
}
