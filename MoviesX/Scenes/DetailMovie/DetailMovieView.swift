//
//  DetailMovie.swift
//  MoviesX
//
//  Created by Wilmer Mendoza on 27/5/21.
//

import SwiftUI
import Kingfisher


struct DetailMovieView: View {
    
    @StateObject private var movieDetailViewModel = MovieDetailViewModel()

    private let baseImageUrl = BackendURLWorker().getBaseImageUrl()
    
    let movie: MoviesResponse.Movie
    
    var body: some View {
        
        GeometryReader { geometryReader in
                
            ZStack {
                    
                VStack(spacing: 0) {
                    
                    KFImage(URL(string: "\(baseImageUrl)\(movie.backdropPath ?? "")"))
                        .placeholder {
                            Image(systemName: "photo.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .clipped()
                                .frame(width: 130, height: 180)
                            
                        }
                        .resizable()
                        .clipped()
                        .frame(width: geometryReader.size.width, height: geometryReader.size.height * 0.25)
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(Color("brown1"))
                        
                    
                    VStack {
                            
                        Spacer()
                            
                        ScrollView(.vertical, showsIndicators: true, content: {
                                
                            HStack {
                                
                                VStack(alignment: .leading, spacing: 35) {
                                    
                                    //Seccion 1
                                    VStack(alignment: .leading, spacing: 19) {
                                        
                                        VStack(alignment: .leading, spacing: 12) {
                                            Text("movie_detail_summary".localized())
                                                .font(Font.system(size: 18, weight: .bold))
                                                .foregroundColor(Color("algaeGreen"))
                                            
                                            Text(movie.title ?? "N/A")
                                                .font(Font.system(size: 17))
                                                .foregroundColor(.white)
                                        }
                                       
                                        VStack(alignment: .leading, spacing: 32) {
                                            
                                            Text(movie.overview ?? "N/A")
                                                .font(Font.system(size: 12))
                                                .foregroundColor(.white)
                                                .padding(.trailing, 12)

                                            VStack(alignment: .leading, spacing: 6, content: {
                                                
                                                Text("movie_detail_rate".localized())
                                                    .font(Font.system(size: 12, weight: .bold))
                                                    .foregroundColor(.white)

                                                ZStack {
                                                    Circle()
                                                        .frame(width: 50, height: 50)
                                                        .foregroundColor(Color("algaeGreen"))
                                                
                                                    Text("7.0")
                                                        .font(Font.system(size: 18, weight: .bold))
                                                        .foregroundColor(Color.white)
                                                }
                                            })
                                        }
                                    }
                                
                                    //Seccion 3
                                    VStack(alignment: .leading, spacing: 29) {
                                        Text("movie_detail_cast".localized())
                                            .font(Font.system(size: 18, weight: .bold))
                                            .foregroundColor(Color("algaeGreen"))
                                        
                                        ScrollView(.horizontal, showsIndicators: true, content: {
                                            
                                            VStack {
                                                HStack(spacing: 21) {
                                                    
                                                    ForEach(movieDetailViewModel.casting, id: \.id) { casting in
                                                        NavigationLink(
                                                            destination: ProfileView(profileId: casting.id ?? 0),
                                                            label: {
                                                                
                                                                VStack {
                                                                    KFImage(URL(string: "\(baseImageUrl)\(casting.profilePath ?? "")"))
                                                                        .placeholder {
                                                                            Image(systemName: "photo.fill")
                                                                                .resizable()
                                                                                .aspectRatio(contentMode: .fit)
                                                                                .clipped()
                                                                                .frame(width: 120, height: 120)

                                                                        }
                                                                        .resizable()
                                                                        .clipped()
                                                                        .frame(width: 120, height: 120)
                                                                        .aspectRatio(contentMode: .fill)
                                                                        .cornerRadius(60)
                                                                        .foregroundColor(Color("brown1"))
                                                                    
                                                                    Text(casting.name ?? "")
                                                                        .font(Font.system(size: 12, weight: .semibold))
                                                                        .foregroundColor(.white)
                                                                }
                                                            })
                                                    }
                                                }
                                            }
                                        })
                                        .padding(.trailing, 12)
                                        .padding(.leading, -23)
                                    }
                                }
                                Spacer()
                                                                
                            }
                            .padding(.leading, 45)
                            
                        })
                    }
                    .background(RoundedRectangle(cornerRadius: 25)
                                    .frame(width: geometryReader.size.width * 0.9, height: geometryReader.size.height * 0.8)
                                    .foregroundColor(Color("black2"))
                                )
                }
            }
            .background(Color("dark"))
        }
        .ignoresSafeArea()
        .onAppear {
            guard let movieId = movie.id else {return }
            movieDetailViewModel.getMovieCasting(movieId: movieId)
        }
        .overlay(
            
            //Loader
            ZStack {
                if movieDetailViewModel.showLoader {
                    LoaderView(color: Color("algaeGreenOpaque"),
                               size: 60)
                }
            }
        )
        .alert(isPresented: $movieDetailViewModel.showAlert) {

            return Alert(title: Text(movieDetailViewModel.titleAlert),
                            message: Text(movieDetailViewModel.messageAlert),
                            dismissButton: .default(Text("moviex_accept".localized())))
        }
    }
}

struct DetailMovie_Previews: PreviewProvider {
    static var previews: some View {
        DetailMovieView(movie: movieDebug)
    }
}
