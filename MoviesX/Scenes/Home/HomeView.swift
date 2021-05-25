//
//  HomeView.swift
//  MoviesX
//
//  Created by Wilmer Mendoza on 25/5/21.
//

import SwiftUI

struct HomeView: View {
    
    @State private var selection = 0
    
    var body: some View {
        NavigationView(content: {
            VStack {
                TabView(selection: $selection) {
                   MovieMinitureView()
                    .frame(width: 200, height: 300)
                        .tag(0)
                    Text("Top Rated")
                        .tag(1)
                    Text("Upcoming")
                        .tag(2)
                    Text("Now Playing")
                        .tag(3)
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                
                Divider()
                
                TabBarView(selection: $selection)
            }
            .navigationBarTitle("Movies", displayMode: .automatic)
            .blueNavigation
        })
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
