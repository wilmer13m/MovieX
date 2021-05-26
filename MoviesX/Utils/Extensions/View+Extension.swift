//
//  View+Extension.swift
//  MoviesX
//
//  Created by Wilmer Mendoza on 25/5/21.
//

import SwiftUI

extension View {
    
    var darkNavigation: some View {
        self.navigationBarColor(UIColor(named: "black4") ?? .white, textColor: UIColor.white)
    }
    
    func navigationBarColor(_ backgroundColor: UIColor, textColor: UIColor) -> some View {
      self.modifier(NavigationBarModifier(backgroundColor: backgroundColor, textColor: textColor))
    }
}
