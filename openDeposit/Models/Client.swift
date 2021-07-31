//
//  Client.swift
//  openDeposit
//
//  Created by Михаил on 31.07.2021.
//
//ебаный миша ты можешь комментить, чтобы не копаться в этом 2 часа?

struct Client {
    let name: String
    let surname: String
}

extension Client {
    static func getClientInfo() -> Client {
        Client(
            name: "Евгения",
            surname: "Бруйко"
            )
    }
}
