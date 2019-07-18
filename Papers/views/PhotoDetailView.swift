//
//  PhotoDetailView.swift
//  Papers
//
//  Created by Don Bytyqi on 7/18/19.
//  Copyright © 2019 Don Bytyqi. All rights reserved.
//

import SwiftUI

struct PhotoDetailView: View {
    
    var photo: Photo
    
    var body: some View {
        
        VStack {
            ScrollView {
                
                RemoteImage(imageUrl: photo.user.profile_image["large"] ?? "")
                    .frame(width: 170, height: 150, alignment: .center)
                    .clipShape(Circle())
                    .shadow(radius: 6)
                
                Text(photo.user.name)
                    .foregroundColor(.black)
                    .padding(EdgeInsets(top: 0.0, leading: 0.0, bottom: 8.0, trailing: 0.0))
                
                if !photo.user.bio.isEmpty {
                    
                    Text(photo.user.bio)
                        .foregroundColor(.gray)
                        .frame(width: 250, height: 100)
                        .lineLimit(nil)
                    
                }
                
                RemoteImage(imageUrl: photo.urls["regular"] ?? "")
                    .frame(width: UIScreen.main.bounds.width)
                
            }
        }
        
        
    }
    
}
