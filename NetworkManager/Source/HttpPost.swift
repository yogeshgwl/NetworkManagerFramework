//
//  HttpPost.swift
//  UVM
//
//  Created by gwl-18 on 18/03/19.
//  Copyright © 2019 gwl. All rights reserved.
//

import Foundation
import Alamofire

class HttpPost: HttpRequests {
    
    func requestPost(){
        Alamofire.request(self.requestUrl!, method: .post, parameters: self.parameters!, encoding: JSONEncoding.default, headers: NetworkManager.shared.headerParam).responseJSON { (response) in
            guard let handler = self.handlerWithResponse else {
                return
            }
            handler(response);
        };
    }
}
