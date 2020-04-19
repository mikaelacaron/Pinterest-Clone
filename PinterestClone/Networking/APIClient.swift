//
//  APIClient.swift
//  PinterestClone
//
//  Created by Mikaela Caron on 4/17/20.
//  Copyright © 2020 Mikaela Caron. All rights reserved.
//

import UIKit

enum Either<T> {
    case success(T)
    case error(Error)
}

enum APIError: Error {
    case unknown, badResponse, jsonDecoder, imageDownload, imageConvert
}

protocol APIClient {
    var session: URLSession { get }
    func get<T: Codable>(with request:URLRequest, completion: @escaping (Either<[T]>) -> Void)
}

extension APIClient {
    var session: URLSession { return URLSession.shared }
    
    func get<T: Codable>(with request:URLRequest, completion: @escaping (Either<[T]>) -> Void) {
        
        let task = session.dataTask(with: request) { (data, response, error) in
            guard error == nil else {
                completion(.error(error!))
                return
            }
            guard let response = response as? HTTPURLResponse, 200..<300 ~= response.statusCode else {
                completion(.error(APIError.badResponse))
                return
            }
            
            do {
                guard let value = try? JSONDecoder().decode([T].self, from: data!) else {
                    completion(.error(APIError.jsonDecoder))
                    return
                }
                DispatchQueue.main.async {
                    completion(.success(value))
                }
            }//end do
            
        }//end dataTask
        
        task.resume()
        
    }//end get
}//end extension APIClient
