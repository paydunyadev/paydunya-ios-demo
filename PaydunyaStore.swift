//
//  PaydunyaStore.swift
//  PayDunya
//
//  Created by PayDunya on 7/22/19.
//  Copyright © 2019 PayDunya. All rights reserved.
//

import Foundation

import Alamofire

class PaydunyaStore
{
    let name: String
    let tagline: String
    let postal_address: String
    let phone: Int
    let logo_url: String
    let website_url: String
    
    var total_amount: Int = 0
    var description: String = ""
    var items: [String: Any] = [:]
    var taxes: [String: Any] = [:]
    
    
    init(name: String, tagline: String, postal_address: String, phone: Int, logo_url: String,  website_url: String)
    {
        self.name = name
        self.tagline = tagline
        self.postal_address = postal_address
        self.phone = phone
        self.logo_url = logo_url
        self.website_url = website_url
        
    }
    
    
    func store()->[String: Any]
    {
       
        let Parameters = [
           
            "store": [
                "name": self.name,
                "tagline": self.tagline,
                "postal_address": self.postal_address ,
                "phone": self.phone ,
                "logo_url": self.logo_url,
                "website_url": self.website_url
            ]
        ]
        return Parameters["store"]!
    }
   
    func invoices()->[String: Any]
    {
        
        let invoice = [
            
            "items": [self.items],
            "taxes": [self.taxes],
            "total_amount": self.total_amount,
            "description": self.description
            ] as [String : Any]
        return invoice
    }
}
