//
//  ContentView.swift
//  Papers
//
//  Created by Don Bytyqi on 7/18/19.
//  Copyright © 2019 Don Bytyqi. All rights reserved.
//

import SwiftUI
import Combine

struct ContentView: View {
    
    @EnvironmentObject var photoStore: PhotoStore
    
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(photoStore.photos) {
                    photo in
                    NavigationLink(destination: PhotoDetailView(photo: photo)) {
                        PhotoRow(photo: photo)
                    }
                }
            }
            
//            List {
//                ForEach(photoStore.photos) {photo in
//                    NavigationLink(destination: PhotoDetailView(photo: photo)) {
//                        PhotoRow(photo: photo)
//                    }
//                }
//                Rectangle().foregroundColor(.clear)
//                    .onAppear {
//                        self.photoStore.fetchMore()
//                }
//            }
            .navigationBarTitle(Text("Photos"))
        }.onAppear(perform: load)
    }
    
    func load() {
        photoStore.fetch()
    }

}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
