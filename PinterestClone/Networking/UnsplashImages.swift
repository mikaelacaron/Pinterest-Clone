//
//  UnsplashImages.swift
//  PinterestClone
//
//  Created by Mikaela Caron on 4/17/20.
//  Copyright © 2020 Mikaela Caron. All rights reserved.
//

import Foundation

typealias Photos = [Photo]

struct Photo: Codable {
    let id: String
    let urls: URLS
}//end struct Photo

struct URLS: Codable {
    let raw: URL
    let full: URL
    let regular: URL
    let small: URL
    let thumb: URL
}
