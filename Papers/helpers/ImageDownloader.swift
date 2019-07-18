//
//  ImageDownloader.swift
//  Papers
//
//  Created by Don Bytyqi on 7/18/19.
//  Copyright © 2019 Don Bytyqi. All rights reserved.
//

import SwiftUI
import Combine

struct RemoteImage: View {
    @ObjectBinding var imageDownloader: ImageDownloader

    init(imageUrl: String) {
        imageDownloader = ImageDownloader(imageURL: imageUrl)
    }

    var body: some View {
        
        Image(uiImage: UIImage(data: imageDownloader.data) ?? UIImage())
            .renderingMode(.original)
            .resizable()
            .scaledToFill()
        
    }
}

class ImageDownloader: BindableObject {
      
    let willChange = PassthroughSubject<Data, Never>()
    var data = Data()

    init(imageURL: String) {
        guard let url = URL(string: imageURL) else { return }

        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }

            DispatchQueue.main.async {
                self.willChange.send(data)
                self.data = data }

            }.resume()
    }
}
