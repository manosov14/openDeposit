//
//  Conditions.swift
//  openDeposit
//
//  Created by Михаил on 01.08.2021.
//

struct Deposit {
    static var offer =
        Offer(
            offerName: "Вклад накопительный",
            currency: Currency(
                code: 810,
                charCode: "Российский рубль"),
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
                Condition(
                    sumFrom: 15000,
                    sumTo: 300000,
                    interest: 5),
                Condition(
                    sumFrom: 300000,
                    sumTo: 1000000,
                    interest: 6),
                Condition(
                    sumFrom: 1000000,
                    sumTo: 999999999,
                    interest: 7)
            ]
        )
}

struct Offer {
    let offerName: String
    let currency: Currency
    let isWithdrawal: Type
    let isReplenishable: Type
    let isProlongation: Type
    let isCapitalization: Type
    let conditions: [Condition]
    
    static func getDepositConditions() -> Offer {
        Offer(
            offerName: "Вклад накопительный",
            currency: Currency(
                code: 810,
                charCode: "Российский рубль"),
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
                Condition(
                    sumFrom: 15000,
                    sumTo: 300000,
                    interest: 5),
                Condition(
                    sumFrom: 300000,
                    sumTo: 1000000,
                    interest: 6),
                Condition(
                    sumFrom: 1000000,
                    sumTo: 999999999,
                    interest: 7)
            ]
        )
    }
}

struct Condition {
    let sumFrom: Int
    let sumTo: Int
    let interest: Int
}
