//
//  PhotoDetailView.swift
//  Papers
//
//  Created by Don Bytyqi on 7/18/19.
//  Copyright © 2019 Don Bytyqi. All rights reserved.
//

import SwiftUI
import Photos

struct PhotoDetailView: View {
    
    var photo: Photo
    @EnvironmentObject var photoStore: PhotoStore
    
    var body: some View {
        
        ScrollView {
            
            HStack {
                RemoteImage(imageUrl: photo.user.profile_image["large"] ?? "")
                    .frame(width: 100, height: 80, alignment: .leading)
                    .clipShape(Circle())
                    .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 0))
                
                VStack(alignment: .leading) {
                    
                    Text(photo.user.name)
                        .foregroundColor(.black)
                    
                    if !photo.user.bio.isEmpty {
                        Divider().frame(width: 200)
                    }
                    
                    Text(photo.user.bio)
                        .foregroundColor(.gray)
                        .font(.subheadline)
                        .lineLimit(3)
                        .frame(width: 200, alignment: .leading)
                    
                }
                
                
                
            }.frame(width: UIScreen.main.bounds.width, alignment: .leading)
            
            Divider().frame(height: 50)
            
            RemoteImage(imageUrl: photo.urls["regular"] ?? "")
                .frame(width: 300, height: 200, alignment: .leading)
                .padding(EdgeInsets(top: 128, leading: 0, bottom: 0, trailing: 0 ))
                .contextMenu {
                    VStack {
                        HStack {
                            Button("Save Image") {
                            }
                        }
                    }
            }
            
            
        }
        
    }
    
    func loadUserPhotos() {
        // this needs to be a different method but it works for now :p
        photoStore.fetch(orderBy: "", username: photo.user.name)
    }
    
}
