//
//  Conditions.swift
//  openDeposit
//
//  Created by Михаил on 30.07.2021.
//


struct Deposit {
    
    //сократил твою говнину чтобы из нее можно было вытащить значения
    
    static var offer =
            Offer(
                offerName: "Вклад накопительный",
                currency: Currency(
                    code: 810,
                    //мне вот нехуй делать кроме как приводить это к стринг? Какая разница символ это или строка
                    //Cделал строкой
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
                //сделал бы словарем, чтобы получать доступ не по воле божьей
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
}

struct Condition {
    let sumFrom: Int
    let sumTo: Int
    let interest: Int
}


//  Че за пиздец? Я должен вызвать параметры, а не городить костыли чтобы создать массив и тащить значения. Нахуя тут такой сложный доступ к параметрам создаваемого offers?

// То что тут было удалил нахуй, подумай что тут было не так


        

