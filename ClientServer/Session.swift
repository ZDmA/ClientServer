//
//  Session.swift
//  ClientServer
//
//  Created by Дмитрий on 03.08.2022.
//

import Foundation

//MARK: pattern Singleton for store session settings
class Session {
    private init() {}

    static var shared = Session()

    var token: String = ""
    var userId: Int = 0
}
