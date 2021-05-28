//
//  DetailActorView.swift
//  MoviesX
//
//  Created by Wilmer Mendoza on 27/5/21.
//

import SwiftUI
import Kingfisher

struct ProfileView: View {
    
    @StateObject private var profileViewModel = ProfileViewModel()
    
    private let baseImageUrl = BackendURLWorker().getBaseImageUrl()
    
    let profileId: Int

    var body: some View {
        VStack {
            GeometryReader(content: { geometry in
                VStack(spacing: 30) {
                    
                    KFImage(URL(string: "\(baseImageUrl)\(profileViewModel.personDetail?.profilePath ?? "")"))
                        .placeholder {
                            Image(systemName: "photo.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .clipped()
                                .frame(width: 130, height: 180)
                        }
                        .resizable()
                        .clipped()
                        .frame(width: geometry.size.width, height: geometry.size.height * 0.30)
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(Color("brown1"))
                        .background(Color("black2"))

                    
                    ScrollView(.vertical, showsIndicators: true, content: {
                        HStack {
                            VStack(alignment: .leading, spacing: 20) {
                                
                                Text("profile_info".localized())
                                    .font(Font.system(size: 18, weight: .bold))
                                    .foregroundColor(Color("algaeGreen"))
                                    
                                HStack {
                                    VStack(alignment: .leading, spacing: 12) {
                                        
                                        VStack(alignment: .leading) {
                                            Text("profile_name".localized())
                                                .font(Font.system(size: 17, weight: .bold))
                                                .foregroundColor(.white)
                                            
                                            Text(profileViewModel.personDetail?.name ?? "N/A")
                                                .font(Font.system(size: 17))
                                                .foregroundColor(.white)
                                        }
                                        
                                        VStack(alignment: .leading) {
                                            Text("profile_birthday".localized())
                                                .font(Font.system(size: 17, weight: .bold))
                                                .foregroundColor(.white)
                                            
                                            Text(profileViewModel.personDetail?.birthday ?? "N/A")
                                                .font(Font.system(size: 17))
                                                .foregroundColor(.white)
                                        }
                                        
                                        VStack(alignment: .leading) {
                                            Text("profile_place_birthday".localized())
                                                .font(Font.system(size: 17, weight: .bold))
                                                .foregroundColor(.white)
                                            
                                            Text(profileViewModel.personDetail?.placeOfBirth ?? "N/A")
                                                .font(Font.system(size: 17))
                                                .foregroundColor(.white)
                                        }
                                        
                                        VStack(alignment: .leading) {
                                            Text("profile_popularity".localized())
                                                .font(Font.system(size: 17, weight: .bold))
                                                .foregroundColor(.white)
                                            
                                            Text("\(String(format: "%.2f", profileViewModel.personDetail?.popularity ?? 0.0))")
                                                .font(Font.system(size: 17))
                                                .foregroundColor(.white)
                                        }
                                        
                                        VStack(alignment: .leading) {
                                            Text("profile_biography".localized())
                                                .font(Font.system(size: 17, weight: .bold))
                                                .foregroundColor(.white)
                                            
                                            Text(profileViewModel.personDetail?.biography ?? "N/A")
                                                .font(Font.system(size: 16, weight: .semibold))
                                                .foregroundColor(.white)
                                        }
                                    }
                                    
                                    Spacer()
                                }
                            }
                            
                            Spacer()
                        }
                        .padding(.leading, 24)

                    })
                }
            })
        }
        .background(Rectangle()
                        .foregroundColor(Color("dark"))
        )
        .ignoresSafeArea()
        .onAppear {
            profileViewModel.getProfileDetail(personId: profileId)
        }
        .overlay(
            
            //Loader
            ZStack {
                if profileViewModel.showLoader {
                    LoaderView(color: Color("algaeGreenOpaque"),
                               size: 60)
                }
            }
        )
        .alert(isPresented: $profileViewModel.showAlert) {

            return Alert(title: Text(profileViewModel.titleAlert),
                            message: Text(profileViewModel.messageAlert),
                            dismissButton: .default(Text("moviex_accept".localized())))
        }
    }
}

struct DetailActorView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(profileId: 819)
    }
}
