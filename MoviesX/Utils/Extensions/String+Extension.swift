//
//  String+Extension.swift
//  MoviesX
//
//  Created by Wilmer Mendoza on 26/5/21.
//

import Foundation

extension String {
    
    func localized(bundle: Bundle = .main, tableName: String = "Localizable") -> String {
        return NSLocalizedString(self, tableName: tableName, value: (self), comment: "")
    }
}
