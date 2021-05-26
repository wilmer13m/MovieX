//
//  HomeView.swift
//  MoviesX
//
//  Created by Wilmer Mendoza on 25/5/21.
//

import SwiftUI

struct HomeView: View {
    
    @State private var selection = 0
    @StateObject private var homeViewModel = HomeViewModel()
    
    private var gridItemLayout = Array(repeating: GridItem(.flexible(), spacing: 0), count: 2)
    
    var body: some View {
        
        NavigationView(content: {
            
            VStack {
                
                TabView(selection: $selection) {
                    
                    //Grid POPULAR
                    ScrollView {
                        LazyVGrid(columns: gridItemLayout, spacing: 8) {
                            // Display the item
                            ForEach(homeViewModel.popularMovies, id: \.id) { movie in
                                MovieMinitureView(with: movie)
                                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 300)
                                    .padding(.horizontal, 4)
                            }
                            Rectangle()
                                .onAppear(perform: {
                                    print("llegue al final...")
                                })
                        }
                        .padding(.top, 10)
                        .padding(.horizontal, 10)
                        .background(Color("black1"))
                    }
                    .padding(.bottom, 139)
                    .tag(0)
                    .background(Color("black1"))
                    
                    //Grid TopRated
                    ScrollView {
                        LazyVGrid(columns: gridItemLayout, spacing: 8) {
                            // Display the item
                            ForEach(homeViewModel.topRatedMovies, id: \.id) { movie in
                                MovieMinitureView(with: movie)
                                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 300)
                                    .padding(.horizontal, 4)
                            }
                            Rectangle()
                                .onAppear(perform: {
                                    print("llegue al final...")
                                })
                        }
                        .padding(.top, 10)
                        .padding(.horizontal, 10)
                        .background(Color("black1"))
                    }
                    .padding(.bottom, 139)
                    .tag(1)
                    .background(Color("black1"))

                    //Grid Upcoming
                    ScrollView {
                        LazyVGrid(columns: gridItemLayout, spacing: 8) {
                            // Display the item
                            ForEach(homeViewModel.upcomingMovies, id: \.id) { movie in
                                MovieMinitureView(with: movie)
                                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 300)
                                    .padding(.horizontal, 4)
                            }
                            Rectangle()
                                .onAppear(perform: {
                                    print("llegue al final...")
                                })
                        }
                        .padding(.top, 10)
                        .padding(.horizontal, 10)
                        .background(Color("black1"))
                    }
                    .padding(.bottom, 139)
                    .tag(2)
                    .background(Color("black1"))
                   
                    //Grid TopRated
                    ScrollView {
                        LazyVGrid(columns: gridItemLayout, spacing: 8) {
                            // Display the item
                            ForEach(homeViewModel.nowPlayingMovies, id: \.id) { movie in
                                MovieMinitureView(with: movie)
                                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 300)
                                    .padding(.horizontal, 4)
                            }
                            Rectangle()
                                .onAppear(perform: {
                                    print("llegue al final...")
                                })
                        }
                        .padding(.top, 10)
                        .padding(.horizontal, 10)
                        .background(Color("black1"))
                    }
                    .padding(.bottom, 139)
                    .tag(3)
                    .background(Color("black1"))
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))

                Divider()

                //Custom tabBar
                TabBarView(selection: $selection,
                           fetchMovies: homeViewModel.loadMovies(by:showFirstPage:))
                    .ignoresSafeArea()
            }
            .ignoresSafeArea()
            .navigationBarTitle("Movies", displayMode: .automatic)
            .darkNavigation
        })
        .navigationViewStyle(StackNavigationViewStyle())
        .onAppear(perform: {
            
            //This will be excecuted the first time that user open the app
            if homeViewModel.loadInitialData {
                homeViewModel.loadMovies(by: .popular)
            }
        })
        .overlay(
            
            //Loader
            ZStack {
                if homeViewModel.showLoader {
                    LoaderView(color: Color("algaeGreenOpaque"),
                               size: 60)
                }
            }
        )
        .alert(isPresented: $homeViewModel.showAlert) {

            return Alert(title: Text(homeViewModel.titleAlert),
                            message: Text(homeViewModel.messageAlert),
                            dismissButton: .default(Text("moviex_accept".localized())))
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
