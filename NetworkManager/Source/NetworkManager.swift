//
//  NetworkManager.swift
//  UVM
//
//  Created by gwl on 06/12/18.
//  Copyright © 2018 gwl. All rights reserved.
//

import Foundation
import Alamofire

// HTTPMethod is Enum value type using to content different Http methods name.
public enum HTTPMethod: String {
    case options = "OPTIONS"
    case get     = "GET"
    case head    = "HEAD"
    case post    = "POST"
    case put     = "PUT"
    case patch   = "PATCH"
    case delete  = "DELETE"
    case trace   = "TRACE"
    case connect = "CONNECT"
}

public enum ResponseStatus: String {
    case success = "Success"
    case failed  = "Failed"
}

// NetworkManager class will be responsable for all the communication/api's call
public class NetworkManager: NSObject {
    
    public static let shared = NetworkManager();
    open var headerParam: Dictionary<String,String> = {
        return ["Content-Type": "application/json", "Accept": "application/json"];
    }()  //Header parameters to set default value in header
    
    
    public func requestApi(httpReqest: HttpRequests){

        if NetworkConnectivity.isConnectedToInternet {
            print("Yes! internet is available.")
            
            httpReqest.handlerWithResponse = { response in
                self.responseResult(response, completionHandler: httpReqest.completionHandler!)
            }
            if let httpReqest = httpReqest as? HttpPost {
                httpReqest.requestPost()
            }
            else if let httpReqest = httpReqest as? HttpGet {
                httpReqest.requestGet()
            }
            else if let httpReqest = httpReqest as? HttpPut {
                httpReqest.requestPut()
            }
            else if let httpReqest = httpReqest as? HttpDelete {
                httpReqest.requestDelete()
            }
        }
        else {
            httpReqest.completionHandler!(nil, ResponseStatus.failed, 404);
        }
    }
    
    public func responseResult(_ response: DataResponse<Any>, completionHandler:(Any?, ResponseStatus, Int)->Void){
        // check for errors
        guard response.result.error == nil else {
            // got an error in getting the data, need to handle it
            print("error calling PUT")
            print(response.result.error!)
            completionHandler(nil, .failed, 404) // = (nil, .failed, 404);
            return
        }
        
        // make sure we got some JSON since that's what we expect
        guard let json = response.result.value as? [String: Any] else {
            print("didn't get todo object as JSON from API")
            if let error = response.result.error {
                print(error.localizedDescription);
                completionHandler(nil, .failed, 404);
            }
            return
        }
        completionHandler(json, .success, 200);
    }
    
    public func setHeaderParamerts(dataDict: Dictionary<String, String>){
        self.headerParam = dataDict;
    }
}


