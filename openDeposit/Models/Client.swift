//
//  Client.swift
//  openDeposit
//
//  Created by Михаил on 31.07.2021.
//

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
