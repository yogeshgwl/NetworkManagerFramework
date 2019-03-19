//
//  HttpRequest.swift
//  UVM
//
//  Created by gwl-18 on 18/03/19.
//  Copyright © 2019 gwl. All rights reserved.
//

import Foundation
import Alamofire

open class HttpRequests: NSObject {
    
    var requestUrl: String?
    var parameters: Dictionary<String,Any>?
    //var headerParameters : Dictionary<String,String> = [:]
    var completionHandler: ((Any?, ResponseStatus, Int)->Void)?
    var handlerWithResponse: ((DataResponse<Any>)->Void)?
    
    convenience init(requestUrl: String, parameters: Dictionary<String,Any>, completionHandler: @escaping (Any?, ResponseStatus, Int)->Void) {
        self.init()
        self.requestUrl = requestUrl
        self.parameters = parameters
        self.completionHandler = completionHandler;
    }
    
    
}
