//
//  ViewController.swift
//  Test
//
//  Created by MhdRassoul on 7/23/19.
//  Copyright © 2019 MhdRassoul. All rights reserved.
//

import UIKit

import Alamofire

import SwiftyJSON


class ViewController: UIViewController {

    
    @IBAction func Paiement(_ sender: Any) {
       
        /*
         *   Préparation de la requete
         */
        
        
        // Initialisation des paramétres de la requete
        var Store = PaydunyaStore(
            name: "paydunyaIOS-Plugin",
            tagline: "L'élégance c'est nous!",
            postal_address: "11500",
            phone: 778064927,
            logo_url: "",
            website_url: ""
        )
        
        Store.total_amount = 200
        Store.description = "Chaussures Croco"
        
        Store.items = [
                "name": "Chaussures Croco",
                "quantity": 3,
                "unit_price": "10000",
                "total_price": "30000",
                "description": "Chaussures faites en peau de crocrodile authentique qui chasse la pauvreté"
        ]
        
        Store.taxes = [
                "name": "TVA (18%)",
                "amount": 12
        ]
       
        //Initialisation des Clé d'API
        let Setup = PaydunyaSetup(
            MasterKey: "9iQ6hGxZ-Ln51-3TH5-rJ8w-Ywj7ofR1umMW",
            PrivateKey: "live_private_p2Sfz3iXvVkvQXqr8tNLBL5s5Pr",
            Token: "qkiNmADLj8fiFarnVqVd",
            cancel_url: " ",
            return_url:  " ",
            callback_url: " "
        )
        
        let invoice = PaydunyaInvoice()
        
        let Headers: HTTPHeaders = Setup.setup()
        let Parametres: Parameters = invoice.Invoice(store: Store, setup: Setup)
          
        // La requete avec Alamofire
        
        AF.request("https://app.paydunya.com/api/v1/checkout-invoice/create",method: .post ,parameters: Parametres,encoding: JSONEncoding.default, headers: Headers).responseJSON
        {
            response in
            print("ResultJSON: \(response.result)")    // On affiche la réponse en JSON
            
            
            // On regarde la réponse renvoyée par la requete
            switch response.result
            {
                case let .success(value): // En cas de Succes de la requete
                    
                    let json = JSON(value)
                    
                    let urlpaiement = json["response_text"].stringValue
                    
                    //On redirige l'utilisateur vers la page de paiement
                    guard let url = URL(string:urlpaiement), !url.absoluteString.isEmpty else {
                        return
                    }
                    UIApplication.shared.open(url, options: [:], completionHandler: nil)
                
                case let .failure(error): print(error)
            }
         
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

