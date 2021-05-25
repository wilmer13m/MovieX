//
//  MovieMinitureView.swift
//  MoviesX
//
//  Created by Wilmer Mendoza on 25/5/21.
//

import SwiftUI
import Kingfisher

struct MovieMinitureView: View {
    
    var body: some View {
        
        ZStack {

            Rectangle()
                .foregroundColor(Color("dark"))
                .cornerRadius(15)

            GeometryReader(content: { geometry in
                
                VStack(alignment: .leading, spacing: 11) {
                   
                    //Cover image
                    KFImage(URL(string: "http://image.tmdb.org/t/p/w500//7gbmM2NWcqZONbp65HUWDf4wr0Q.jpg"))
                        .placeholder {
                            Image(systemName: "heart.fill")
                            
                        }
                        .frame(width: geometry.size.width, height: geometry.size.height * 0.6)
                    
                    //title
                    Text("Who killed Sara?")
                        .font(.system(size: 13, weight: .bold, design: .default))
                        .foregroundColor(Color("algaeGreen"))
                        .padding(.leading, 8)
                    
                    
                    //Date and rating
                    HStack {
                        Text("Date")
                            .font(.system(size: 10, weight: .semibold, design: .default))
                            .foregroundColor(Color("algaeGreen"))
                            .padding(.leading, 8)

                        Spacer()
                        
                        HStack {
                            Image(systemName: "star.fill")
                                .resizable()
                                .foregroundColor(Color("algaeGreen"))
                                .frame(width: 8, height: 9)
                            
                            Text("rating")
                                .font(.system(size: 10, weight: .semibold, design: .default))
                                .foregroundColor(Color("algaeGreen"))
                        }
                        .padding(.trailing, 8)

                    }
                    
                    //Over view
                    Text("pequeño resumen...pequeño resumen...pequeño resumen...pequeño resumen...pequeño resumen...pequeño resumen...")
                        .lineLimit(4)
                        .font(.system(size: 10))
                        .foregroundColor(.white)
                        .padding(.leading, 8)

                }
            })
        }
        .background(Color("black1"))
    }
}

struct MovieMinitureView_Previews: PreviewProvider {
    static var previews: some View {
        MovieMinitureView()
            .previewLayout(.fixed(width: 150, height: 280))
        
    }
}
