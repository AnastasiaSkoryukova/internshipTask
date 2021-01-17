//
//  ScreenViewInfo.swift
//  Avito-internship
//
//  Created by Анастасия Скорюкова on 14.01.2021.
//

import Foundation

struct ScreenViewInfo: Decodable {
    var title: String
    var actionTitle: String
    var selectedActionTitle: String
    
    enum CodingKeys: String, CodingKey {
        case result
    
        case title
        case actionTitle
        case selectedActionTitle
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.title = try container.decode(String.self, forKey: .title)
        self.actionTitle = try container.decode(String.self, forKey: .actionTitle)
        self.selectedActionTitle = try container.decode(String.self, forKey: .selectedActionTitle)
    }
}
