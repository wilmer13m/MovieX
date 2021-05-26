//
//  TabView.swift
//  MoviesX
//
//  Created by Wilmer Mendoza on 25/5/21.
//

import SwiftUI

struct TabBarView: View {
    
    @Binding var selection: Int
    @Namespace private var currentTab
    
    let fetchMovies: ((_ type: MovieType, _ showFirstPage: Bool) -> Void)?
    
    private let tabs = [Tab(image: "suit.heart.fill", label: "Popular"),
                Tab(image: "star.circle.fill", label: "Top rating"),
                Tab(image: "deskclock.fill", label: "Upcoming"),
                Tab(image: "play.tv.fill", label: "Now playing")]

    var body: some View {
        
        HStack {
            
            ForEach(tabs.indices) { index in
                
                GeometryReader { geometry in
                    VStack(spacing: 4) {
                        if selection == index {
                            Color("algaeGreen")
                                .frame(height: 2)
                                .offset(y: -8)
                                .matchedGeometryEffect(id: "currentTab", in: currentTab)
                                .onAppear {
                                    //This is used to fetch movies whe user swipe between tabs
                                    guard let typeMovie = MovieType(rawValue: selection) else { return }
                                    fetchMovies?(typeMovie, true)
                                }
                        }
                        
                        Image(systemName: tabs[index].image)
                            .frame(height: 20)
                            .rotationEffect(.degrees(0))

                        
                        Text(tabs[index].label)
                            .font(.caption2)
                            .fixedSize()
                    }
                    .fixedSize(horizontal: false, vertical: true)
                    .frame(width: geometry.size.width / 2, height: 44, alignment: .bottom)
                    .padding(.horizontal)
                    .foregroundColor(selection == index ? Color(.label) : .secondary)
                    .onTapGesture {
                        withAnimation {
                            selection = index
                        }
                    }
                    .onAppear {
                        guard let typeMovie = MovieType(rawValue: selection) else { return }
                        fetchMovies?(typeMovie, true)
                    }
                }
                .frame(height: 74, alignment: .bottom)
            }
        }
    }
}

struct TabView_Previews: PreviewProvider {
    
    
    static var previews: some View {
        TabBarView(selection: .constant(0), fetchMovies: nil)
            .previewLayout(.sizeThatFits)
    }
}
