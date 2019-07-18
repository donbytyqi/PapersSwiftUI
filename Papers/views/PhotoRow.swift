//
//  PhotoRow.swift
//  Papers
//
//  Created by Don Bytyqi on 7/18/19.
//  Copyright © 2019 Don Bytyqi. All rights reserved.
//

import SwiftUI

struct PhotoRow: View {
    
    var photo: Photo

    var body: some View {
        
        return VStack(alignment: .center) {
            PhotoRowImageView(photo: photo).shadow(radius: 8)
            HStack {
                RemoteImage(imageUrl: photo.user.profile_image["large"] ?? "")
                    .frame(width: 50, height: 50, alignment: .leading)
                    .clipShape(Circle())
                    .padding(EdgeInsets(top: 16.0, leading: 0.0, bottom: 16.0, trailing: 0.0))
                VStack(alignment: .leading) {
                    Text(photo.user.name).foregroundColor(.black)
                    
                    Text(photo.user.bio)
                        .foregroundColor(.gray)
                        .frame(width: 250, alignment: .leading)
                }
                
            }
            
        }.frame(width: UIScreen.main.bounds.width - 32)
        
    }
    
}
