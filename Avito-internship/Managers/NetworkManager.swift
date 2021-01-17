//
//  NetworkManager.swift
//  Avito-internship
//
//  Created by Анастасия Скорюкова on 14.01.2021.
//

import UIKit
//Service to download and cache images

class NetworkManager {
    
    static let shared = NetworkManager()
    let cache = NSCache<NSString, UIImage>()
    private init() {}
    
    
    func downloadImage(from urlString: String, completed: @escaping (UIImage?) -> Void) {
        
        guard let url = URL(string: urlString) else {
            completed(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let self = self,
                  error == nil,
                  let response = response as? HTTPURLResponse, response.statusCode == 200,
                  let data = data,
                  let image = UIImage(data: data) else {
                completed(nil)
                return
            }
            completed(image)
        }
        task.resume()
    }
}
