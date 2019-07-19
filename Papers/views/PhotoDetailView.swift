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
    @EnvironmentObject var photoStore: PhotoStore
    
    var body: some View {
        
        VStack {
            ScrollView {
                
                HStack {
                    RemoteImage(imageUrl: photo.user.profile_image["medium"] ?? "")
                        .frame(width: 100, height: 80, alignment: .leading)
                        .clipShape(Circle())
                        .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 0))
                    
                    VStack(alignment: .leading) {
                        
                        Text(photo.user.name)
                            .foregroundColor(.black)
                        
                        Divider().frame(width: 200)
                        
                        Text(photo.user.bio)
                            .foregroundColor(.gray)
                            .font(.subheadline)
                            .lineLimit(3)
                            .frame(width: 200)
                        
                    }
                }.frame(width: UIScreen.main.bounds.width, alignment: .leading)
                
                Divider().frame(height: 50)
                
                if photoStore.userPhotos.isEmpty {
                    Text("No photos found :(")
                        .font(.largeTitle)
                } else {
                    ForEach(photoStore.userPhotos) {
                        photo in
                        PhotoRow(photo: photo)
                    }
                }
                
            }.onAppear(perform: loadUserPhotos)
        }
        
        
    }
    
    func loadUserPhotos() {
        // this needs to be a different method but it works for now :p
        photoStore.fetch(orderBy: "", username: photo.user.name)
    }
    
}
