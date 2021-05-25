//
//  HomeView.swift
//  MoviesX
//
//  Created by Wilmer Mendoza on 25/5/21.
//

import SwiftUI

struct HomeView: View {
    
    @State private var selection = 0
    
    private var symbols = ["keyboard", "hifispeaker.fill", "printer.fill", "tv.fill", "desktopcomputer", "headphones", "tv.music.note", "mic", "plus.bubble", "video"]
    private var gridItemLayout = Array(repeating: GridItem(.flexible(), spacing: 0), count: 2)
    private var colors: [Color] = [.yellow, .purple, .green]

    
    var body: some View {
        
        NavigationView(content: {
            
            VStack {
                
                TabView(selection: $selection) {
                    
                    ScrollView {
                        LazyVGrid(columns: gridItemLayout, spacing: 8) {
                            // Display the item
                            ForEach(symbols, id: \.self) { travel in
                                MovieMinitureView()
                                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 300)
                                    .padding(.horizontal, 4)
                            }
                        }
                        .padding(.top, 10)
                        .padding(.horizontal, 10)
                        .background(Color("black1"))
                    }
                    .padding(.bottom, 139)
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
                    .ignoresSafeArea()
            }
            .ignoresSafeArea()
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
