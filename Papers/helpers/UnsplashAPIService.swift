//
//  UnsplashAPIService.swift
//  Papers
//
//  Created by Don Bytyqi on 7/18/19.
//  Copyright © 2019 Don Bytyqi. All rights reserved.
//

import Foundation

struct UnsplashAPIService {
    
    static let apiKey = "93404f08ee44f12d92029e7af3cb8803d63f52592e9ab463a70d0c77b0b4d159"
    
    static func getPhotos(page: Int, orderBy: String, username: String = "", completion: @escaping ([Photo]) -> ()) {
        
        var photos = [Photo]()
        
        guard let url = URL(string: username == "" ? "https://api.unsplash.com/photos?page=\(page)&client_id=\(UnsplashAPIService.apiKey)&per_page=50&order_by=\(orderBy)" : "https://api.unsplash.com/users/\(username.replacingOccurrences(of: " ", with: ""))/photos?page=\(page)&client_id=\(UnsplashAPIService.apiKey)") else {
            print("URL is invalid.")
            completion(photos)
            return }
        
        print("URL", url)
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard error == nil else {
                print(error?.localizedDescription ?? "")
                completion(photos)
                return }
            
            do {
                guard let data = data else { return }
                guard let jsonData = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? NSArray else { return }
                for i in jsonData {
                    let item = i as? [String: AnyObject] ?? [:]
                    let photo = Photo(photoDict: item, userDict: item["user"] as? [String: AnyObject] ?? [:])
                    photos.append(photo)
                }
                completion(photos)
            } catch {
                print(error.localizedDescription)
                completion(photos)
            }
            
        }.resume()
        
    }
    
}
