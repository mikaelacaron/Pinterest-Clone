//
//  UnsplashClient.swift
//  PinterestClone
//
//  Created by Mikaela Caron on 4/17/20.
//  Copyright © 2020 Mikaela Caron. All rights reserved.
//

import Foundation

class UnsplashClient: APIClient {
    
    static let baseUrl = "https://api.unsplash.com"
    static let apikey = "-SMsk8VqKbsJ0vbyblVDsw0bdygTRIMpV6DLQRRJaAo"
    
    func fetch(with endpoint:UnsplashEndpoint, completion: @escaping (Either<Photos>) -> Void) {
        
        let request = endpoint.request
        get(with: request, completion: completion)
        
    }//end fetch()
    
}//end class UnsplashClient
