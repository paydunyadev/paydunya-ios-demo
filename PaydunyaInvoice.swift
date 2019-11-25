//
//  PaydunyaInvoice.swift
//  PayDunya
//
//  Created by PayDunya on 7/24/19.
//  Copyright © 2019 PayDunya. All rights reserved.
//

import Foundation

import Alamofire

class PaydunyaInvoice {
    
    func Invoice(store: PaydunyaStore, setup: PaydunyaSetup)-> Parameters
    {
        var invoice: Parameters = [
            "invoice": [
               
            ],
            
            "store": [
            ],
            
            "custom_data": [
            ],
            
            "actions": [
                
            ]
        ]
        
        invoice["invoice"] = store.invoices()
        invoice["store"] = store.store()
        invoice["actions"] = setup.Action()
        
        return invoice
    }
}
