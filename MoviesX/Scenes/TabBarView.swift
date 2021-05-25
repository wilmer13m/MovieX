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
    
    private let tabs = [Tab(image: "house.fill", label: "home"),
                Tab(image: "house.fill", label: "home"),
                Tab(image: "house.fill", label: "home"),
                Tab(image: "house.fill", label: "popular")]

    var body: some View {
        HStack {
            ForEach(tabs.indices) { index in
                GeometryReader { geometry in
                    VStack(spacing: 4) {
                        if selection == index {
                            Color(.label)
                                .frame(height: 2)
                                .offset(y: -8)
                                .matchedGeometryEffect(id: "currentTab", in: currentTab)
                        }
                        
                        if tabs[selection].label == "popular" && tabs[index].label == "popular" {
                            Image(systemName: tabs[index].image)
                                .frame(height: 20)
                                .rotationEffect(.degrees(25))
                        
                        } else {
                            Image(systemName: tabs[index].image)
                                .frame(height: 20)
                                .rotationEffect(.degrees(0))

                        }
                        
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
                }
                .frame(height: 44, alignment: .bottom)
            }
        }
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView(selection: .constant(0))
            .previewLayout(.sizeThatFits)
    }
}
