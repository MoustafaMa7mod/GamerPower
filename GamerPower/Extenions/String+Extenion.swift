//
//  String+Extenion.swift
//  GamerPower
//
//  Created by Mostafa Mahmoud on 14/02/2025.
//

import Foundation

extension String {
  
    var formattedDate: String {
        
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        if let date = inputFormatter.date(from: self) {
            let outputFormatter = DateFormatter()
            outputFormatter.dateFormat = "dd-MM-yyyy"
            return outputFormatter.string(from: date)
        } else {
            return "Invalid Date"
        }
    }
}
