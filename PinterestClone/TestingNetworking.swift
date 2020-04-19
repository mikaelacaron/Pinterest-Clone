//
//  TestingNetworking.swift
//  PinterestClone
//
//  Created by Mikaela Caron on 4/18/20.
//  Copyright © 2020 Mikaela Caron. All rights reserved.
//

import UIKit

final class TestingNetworking {
    
    static let shared = TestingNetworking()
    //private init() {}
    let baseUrl = "https://api.unsplash.com"
    let endpoint = "/photos"
    
    func getImageUrl() {
        
        let imageEndpoint = baseUrl + endpoint
        guard let url = URL(string: imageEndpoint) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let error = error {
                print(error)
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                print("Error with response")
                return
            }
            
            guard let data = data else { return }
            
            do {
                
                guard let json = try JSONSerialization.jsonObject(with: data, options: [.allowFragments]) as? [String: Any] else { return }
                
                let imageUrl = json["url"] as? String ?? ""
                self.getImageData(url: imageUrl)
                
            } catch {
                print("JSON error")
            }
            
        }//end let task
        
        task.resume()
        
    }//end getImageUrl()
    
    func getImageData(url: String) {
        
        guard let url = URL(string: url) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let error = error {
                print(error)
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                print("Error with response")
                return
            }
            
            guard let data = data else { return }
            
            guard let image = UIImage(data: data) else {
                return
            }
            
        }//end let task
        
        task.resume()
        
    }//end getImages()
    
}//end final class TestingNetworking
