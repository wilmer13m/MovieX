//
//  LoaderView.swift
//  MoviesX
//
//  Created by Wilmer Mendoza on 26/5/21.
//

import SwiftUI

struct LoaderView: View {
    
    @State private var degress = 0.0
    
    private let initialDegree = 0.0
    private let maxDegree = 360.0
    private let plusDegree = 10.0
    private let timeInterval = 0.04
    private let lineWidth: CGFloat = 4.5
    
    let color: Color
    let size: CGFloat

    var body: some View {
        Circle()
            .trim(from: 0.0, to: 0.8)
            .stroke(color, lineWidth: lineWidth)
            .frame(width: size, height: size)
            .rotationEffect(Angle(degrees: degress))
            .onAppear{
                self.start()
            }
    }
    
    func start() {
        Timer.scheduledTimer(withTimeInterval: timeInterval, repeats: true) { timer in
            withAnimation {
                self.degress += plusDegree
            }
            if self.degress == maxDegree {
                self.degress = initialDegree
            }
        }
    }
}

struct ActivityIndicator_Previews: PreviewProvider {
    static var previews: some View {
        LoaderView(color: Color.green, size: 60)
    }
}
