//
//  MovieMinitureView.swift
//  MoviesX
//
//  Created by Wilmer Mendoza on 25/5/21.
//

import SwiftUI
import Kingfisher

struct MovieMinitureView: View {
    
    private let baseImageUrl = BackendURLWorker().getBaseImageUrl()
    
    let movie: MoviesResponse.Movie
    
    init(with movie: MoviesResponse.Movie) {
        self.movie = movie
    }
    
    var body: some View {
        
        NavigationLink(
            destination: DetailMovieView(movie: movie),
            label: {
                ZStack {

                    Rectangle()
                        .foregroundColor(Color("dark"))
                        .cornerRadius(15)

                    GeometryReader(content: { geometry in
                        
                        VStack(alignment: .leading, spacing: 11) {
                           
                            //Cover image
                            KFImage(URL(string: "\(baseImageUrl)\(movie.posterPath ?? "")"))
                                .placeholder {
                                    Image(systemName: "photo.fill")
                                        .resizable()
                                        .clipped()
                                        .frame(width: geometry.size.width, height: geometry.size.height * 0.6)
                                        .aspectRatio(contentMode: .fill)
                                }
                                .resizable()
                                .clipped()
                                .frame(width: geometry.size.width, height: geometry.size.height * 0.6)
                                .aspectRatio(contentMode: .fit)
                                .foregroundColor(Color("brown1"))
                            
                            //title
                            Text(movie.title ?? "N/A")
                                .font(.system(size: 13, weight: .bold, design: .default))
                                .foregroundColor(Color("algaeGreen"))
                                .padding(.leading, 8)
                            
                            
                            //Date and rating
                            HStack {
                                Text(movie.releaseDate ?? "N/A")
                                    .font(.system(size: 10, weight: .semibold, design: .default))
                                    .foregroundColor(Color("algaeGreen"))
                                    .padding(.leading, 8)

                                Spacer()
                                
                                HStack {
                                    Image(systemName: "star.fill")
                                        .resizable()
                                        .foregroundColor(Color("algaeGreen"))
                                        .frame(width: 8, height: 9)
                                    
                                    Text("\(String(format: "%.2f", movie.voteAverage ?? 0.0))")
                                        .font(.system(size: 10, weight: .semibold, design: .default))
                                        .foregroundColor(Color("algaeGreen"))
                                }
                                .padding(.trailing, 8)

                            }
                            
                            //Over view
                            Text(movie.overview ?? "N/A")
                                .lineLimit(4)
                                .font(.system(size: 10))
                                .foregroundColor(.white)
                                .padding(.leading, 8)

                        }
                    })
                }
                .background(Color("black1"))

            })
    }
}

struct MovieMinitureView_Previews: PreviewProvider {
    static var previews: some View {
        MovieMinitureView(with: movieDebug)
            .previewLayout(.fixed(width: 150, height: 280))
        
    }
}
