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
    let offerId: String
    let maxPercentRate: Int
    let minTerm: Int
    let currency: Currency
    let isWithdrawal: Type
    let isReplenishable: Type
    let isProlongation: Type
    let isCapitalization: Type
    let percentPayOut: String
    let conditions: [Condition]
}

struct Condition {
    let sumFrom: Int
    let sumTo: Int
    let minTerm: Int
    let maxTerm: Int
    let interest: Int
}

extension Deposit {
    static func getDepositConditions() -> Deposit {
        Deposit(
            offers: [
                Offer(
                    offerName: "Вклад накопительный",
                    offerId: "DEPOZ_NAKOP",
                    maxPercentRate: 6,
                    minTerm: 367,
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
                    percentPayOut: "В конце срока",
                    conditions: [
                        Condition(
                            sumFrom: 15000,
                            sumTo: 300000,
                            minTerm: 91,
                            maxTerm: 365,
                            interest: 5),
                        Condition(
                            sumFrom: 300000,
                            sumTo: 1000000,
                            minTerm: 366,
                            maxTerm: 900,
                            interest: 7),
                        Condition(
                            sumFrom: 1000000,
                            sumTo: 999999999,
                            minTerm: 901,
                            maxTerm: 1097,
                            interest: 9)
                    ]
                )
            ]
        )
    }
}
