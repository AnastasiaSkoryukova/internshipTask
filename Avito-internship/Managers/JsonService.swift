//
//  Interactor.swift
//  Avito-internship
//
//  Created by Анастасия Скорюкова on 14.01.2021.
//

import Foundation

protocol JsonServiceDelegate {
    func collectionViewItemsFetched(_ items: [CollectionViewInfoItem])
    func screenViewInfoFetched(_ data: ScreenViewInfo)
}
//Service which works with data from the model to decode it into appropriate format to display

class JsonService {
    
    var delegate: JsonServiceDelegate?
    
    //    Getting the data for the screen: button title, main title
    func getScreenInfo() {
        let path = Bundle.main.path(forResource: "result", ofType: "json")
        let jsonData = try! String(contentsOfFile: path!).data(using: .utf8)!
        
        do {
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            let screenViewInfo = try decoder.decode(ScreenInfoItemResponse.self, from: jsonData)
            
            if screenViewInfo.screenInfoItem != nil {
                self.delegate?.screenViewInfoFetched(screenViewInfo.screenInfoItem!)
            }
        }
        catch {
            print("Problems with Json parsing")
        }
    }
    
    //    Getting the data for the collection view cells
    
    func getCollectionViewInfo() {
        let path = Bundle.main.path(forResource: "result", ofType: "json")
        let jsonData = try! String(contentsOfFile: path!).data(using: .utf8)!
        
        do{
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            let response = try decoder.decode(CollectionViewItemsResponse.self, from: jsonData)
            
            if response.collectionViewItems != nil {
                self.delegate?.collectionViewItemsFetched(response.collectionViewItems ?? [])
            }
        }
        catch {
            print("Problems with Json parsing")
        }
    }
}
