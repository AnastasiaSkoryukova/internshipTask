//
//  CollectionViewItemsResponse.swift
//  Avito-internship
//
//  Created by Анастасия Скорюкова on 14.01.2021.
//

import Foundation

struct CollectionViewItemsResponse: Decodable {
    var collectionViewItems: [CollectionViewInfoItem]?
    
    enum CodingKeys: String, CodingKey {
        case result
        case list
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let resultContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .result)
        self.collectionViewItems = try resultContainer.decode([CollectionViewInfoItem].self, forKey: .list)
    }
}
