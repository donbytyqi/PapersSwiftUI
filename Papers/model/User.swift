//
//  User.swift
//  Papers
//
//  Created by Don Bytyqi on 7/18/19.
//  Copyright © 2019 Don Bytyqi. All rights reserved.
//

import SwiftUI

struct User: Identifiable, Codable {
    var id: String
    var name: String
    var username: String
    var bio: String
    var profile_image: [String: String]
}
