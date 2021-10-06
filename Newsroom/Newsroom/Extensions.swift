//
//  Extensions.swift
//  Newsroom
//
//  Created by Sarvesh Suryavanshi on 07/10/21.
//

import UIKit

//MARK: - Extension for UIImage

extension UIImageView {
    
    func loadImage(imageURL: URL) {
        DispatchQueue.global().async {
            if let imageData = try? Data(contentsOf: imageURL) {
                if let image = UIImage(data: imageData) {
                    DispatchQueue.main.async {
                        self.image = image
                    }
                }
            }
        }
    }
}

//MARK: - Extension for Date

extension Date {
    
    var displayDate: String {
        // Create Date Formatter
        let dateFormatter = DateFormatter()
        // Set Date/Time Style
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .short
        // Convert Date to String
       return dateFormatter.string(from: self)
    }
}
