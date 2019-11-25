//
//  paydunyaSetup.swift
//  PayDunya
//
//  Created by PayDunya on 7/19/19.
//  Copyright © 2019 PayDunya. All rights reserved.
//

import Foundation

import Alamofire

class PaydunyaSetup
{
    let MasterKey: String
    let PrivateKey: String
    let Token: String
    let cancel_url: String
    let return_url: String
    let callback_url: String

    
    init(MasterKey: String, PrivateKey: String, Token: String, cancel_url: String, return_url: String, callback_url: String)
    {
        self.MasterKey = MasterKey
        self.PrivateKey = PrivateKey
        self.Token = Token
        self.cancel_url = cancel_url
        self.return_url = return_url
        self.callback_url = callback_url
        
    }
    
    func Action()->[String: Any]
    {
        let actions: [String: Any] = [
            "cancel_url": self.cancel_url,
            "return_url": self.return_url,
            "callback_url": self.callback_url
        ]
        return actions
    }
    
    
    func setup()->HTTPHeaders
    {
        let Headers: HTTPHeaders = [
            "User-Agent": "paydunya-ios/v1.0",
            "Content-Type": "application/json",
            "PAYDUNYA-MASTER-KEY": self.MasterKey ,
            "PAYDUNYA-PRIVATE-KEY": self.PrivateKey ,
            "PAYDUNYA-TOKEN": self.Token,
        ]
        return Headers
    }
}
