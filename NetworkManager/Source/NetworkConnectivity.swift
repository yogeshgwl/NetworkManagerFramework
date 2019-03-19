//
//  NetworkConnectivity.swift
//  UVM
//
//  Created by gwl-18 on 19/03/19.
//  Copyright © 2019 gwl. All rights reserved.
//

import Foundation
import Alamofire

class NetworkConnectivity {
    class var isConnectedToInternet:Bool {
        return NetworkReachabilityManager()?.isReachable ?? false
    }
}
