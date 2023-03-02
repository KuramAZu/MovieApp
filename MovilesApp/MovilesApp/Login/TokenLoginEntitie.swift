//
//  TokenLoginEntitie.swift
//  MovilesApp
//
//  Created by Domingo on 24/Feb/2023.
//

import Foundation
import UIKit

//MARK: GET: WS =  /authentication/token/new
struct TokenLoginEnt: Decodable{
    var success: Bool
    var expires: String
    var token: String
    
    enum CodingKeys: String, CodingKey{
        case success
        case expires = "expires_at"
        case token = "request_token"
    }
}
