//
//  HttpDelete.swift
//  UVM
//
//  Created by gwl-18 on 18/03/19.
//  Copyright © 2019 gwl. All rights reserved.
//

import Foundation
import Alamofire

class HttpDelete: HttpRequests {
    
    func requestDelete(){
        Alamofire.request(self.requestUrl!, method: .delete, parameters: self.parameters!, encoding: JSONEncoding.default, headers: NetworkManager.shared.headerParam).responseJSON { (response) in
            guard let handler = self.handlerWithResponse else {
                return
            }
            handler(response);
        };
    }
}
