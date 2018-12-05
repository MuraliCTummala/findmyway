//
//  FlightAwareService.swift
//  findmyway
//
//  Created by Murali Tummala on 12/4/18.
//  Copyright © 2018 Murali Tummala. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class FlightAwareService {
    
    func apiflightSchedules(flightNumber : String, completionHandler: @escaping (JSON) ->()) {
        let parameters: Parameters = [
            "ident": flightNumber,
            "include_ex_data": "true"
        ]
        Alamofire.request("https://flightxml.flightaware.com/json/FlightXML3/FlightInfoStatus?",
                          parameters: parameters)
            
            .authenticate(user: "kimate", password: "6ea9e24e929403785d2f2bd99684a76fda3aed14")
            .responseJSON
            {response in
                print("Request: \(String(describing: response.request))")   // original url request
                print("Response: \(String(describing: response.response))") // http url response
                print("Result: \(response.result)")                         // response serialization result
                
                if let json = response.result.value {
                    print("JSON: \(json)") // serialized json response
                    completionHandler(JSON(json))
                }
                
                if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                    print("Data: \(utf8Text)") // original server data as UTF8 string
                }
        }
        
    }
    
    
    func apiCall( completionHandler: @escaping (JSON) ->()) {
        
        Alamofire.request("https://httpbin.org/get").responseJSON { response in
            print("Request: \(String(describing: response.request))")   // original url request
            print("Response: \(String(describing: response.response))") // http url response
            print("Result: \(response.result)")                         // response serialization result
            
            if let json = response.result.value {
                print("JSON: \(json)") // serialized json response
                completionHandler(JSON(json))
            }
            
            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                print("Data: \(utf8Text)") // original server data as UTF8 string
            }
        }
    }
}
