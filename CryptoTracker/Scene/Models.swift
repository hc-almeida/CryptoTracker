//
//  Models.swift
//  CryptoTracker
//
//  Created by Hellen on 04/11/21.
//

import Foundation

struct Crypto: Decodable {
    
    let assetId: String?
    
    let name: String?
    
    let price: Double?
    
    var image: String?
    
    enum CodingKeys: String, CodingKey {
        case assetId = "asset_id"
        case name = "name"
        case price = "price_usd"
    }
}

struct Icon: Codable {
    let assetId: String
    let url: String
    
    enum CodingKeys: String, CodingKey {
        case assetId = "asset_id"
        case url = "url"
    }
}
