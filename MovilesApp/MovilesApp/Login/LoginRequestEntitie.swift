//
//  LoginRequestEntitie.swift
//  MovilesApp
//
//  Created by Domingo on 24/Feb/2023.
//

import Foundation
import UIKit

//MARK: POST: WS =  /authentication/token/validate_with_login
struct LoginRequestEnt: Decodable, Encodable{
    var username: String
    var password: String
    var request_token: String
}

struct LoginRequestResponseEnt: Decodable{
    var success: Bool
    var status_code: String
    var status_message: String
}
