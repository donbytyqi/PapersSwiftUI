//
//  Photo.swift
//  Papers
//
//  Created by Don Bytyqi on 7/18/19.
//  Copyright © 2019 Don Bytyqi. All rights reserved.
//

import SwiftUI

extension Photo {
    init(photoDict: [String: AnyObject], userDict: [String: AnyObject]) {
        self.init(id: photoDict["id"] as? String ?? "", url: photoDict["url"] as? String ?? "", created_at: photoDict["created_at"] as? String ?? "", description: photoDict["description"] as? String ?? "", urls: photoDict["urls"] as? [String: String] ?? [:], user: User(id: userDict["id"] as? String ?? "", name: userDict["name"] as? String ?? "", bio: userDict["bio"] as? String ?? "", profile_image: userDict["profile_image"] as? [String: String] ?? [:]))
    }
}

struct Photo: Identifiable, Codable {
    
    var id: String
    var url: String
    var created_at: String
    var description: String
    var urls: [String: String]
    var user: User
    
    
}

extension Photo: Equatable {
    static func == (lhs: Photo, rhs: Photo) -> Bool {
        return lhs.id == rhs.id
    }
}
