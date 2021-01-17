//
//  CollectionViewInfo.swift
//  Avito-internship
//
//  Created by Анастасия Скорюкова on 13.01.2021.
//

import Foundation

struct CollectionViewInfoItem: Decodable, Hashable {
    
    var title = ""
    var description = ""
    var iconUrl = ""
    var price = ""
    var isSelected = true
    
    enum CodingKeys: String, CodingKey {
        case result
        case list
        
        case title
        case description
        
        case icon
        case iconUrl = "52x52"
        
        case price
        case isSelected
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.title = try container.decode(String.self, forKey: .title)
        self.description = try container.decodeIfPresent(String.self, forKey: .description) ?? ""
        let iconContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .icon)
        self.iconUrl = try iconContainer.decode(String.self, forKey: .iconUrl)
        self.price = try container.decode(String.self, forKey: .price)
        self.isSelected = try container.decode(Bool.self, forKey: .isSelected)
    }
}


