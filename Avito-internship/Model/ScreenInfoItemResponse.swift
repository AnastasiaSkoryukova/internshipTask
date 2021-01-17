//
//  Response.swift
//  Avito-internship
//
//  Created by Анастасия Скорюкова on 14.01.2021.
//

import Foundation

struct ScreenInfoItemResponse: Decodable {
    var screenInfoItem: ScreenViewInfo?
    
    enum CodingKeys: String, CodingKey {
        case result
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.screenInfoItem = try container.decode(ScreenViewInfo.self, forKey: .result)
    }
}
