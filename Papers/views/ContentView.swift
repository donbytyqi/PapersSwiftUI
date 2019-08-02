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
    @State var showingSheet = false
    @State var orderBy = "curated" {
        didSet {
            self.photoStore.fetch(orderBy: orderBy)
        }
    }
    
    var sheet: ActionSheet {
        
        ActionSheet(title: Text(""), message: Text("Default is ~Curated~"), buttons: [.default(Text("Curated"), action: { self.orderBy = "curated" }), .default(Text("Popular"), action: { self.orderBy = "popular" }), .default(Text("Latest"), action: { self.orderBy = "latest" }), .default(Text("Oldest"), action: { self.orderBy = "oldest" }), .cancel()])
        
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(photoStore.photos) {
                    photo in
                    NavigationLink(destination: PhotoDetailView(photo: photo)) {
                        PhotoRow(photo: photo)
                    }
                }
            }.navigationBarItems(trailing: Button(action: {
                self.showingSheet = true
            }, label: { Text("Order by") } ))
            .actionSheet(isPresented: $showingSheet, content: { sheet })
                .navigationBarTitle(Text("Photos"))
        }.onAppear(perform: load)
    }
    
    func load() {
        photoStore.fetch(orderBy: orderBy)
    }
    
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
