//
//  RandomImageGenerator.swift
//  Molt
//
//  Created by Darshil Agrawal on 07/11/21.
//

import Foundation
import UIKit

func randomImage() -> String {
    let randomInt = Int.random(in: 0...2)
    switch randomInt{
    case 0:
        return "scribble1"
    case 1:
        return "scribble2"
    case 2:
        return "scribble3"
    default:
        return "scribble1"
    }
}

extension UIScreen{
   static let screenWidth = UIScreen.main.bounds.size.width
   static let screenHeight = UIScreen.main.bounds.size.height
   static let screenSize = UIScreen.main.bounds.size
}

func dateStringGenerator(date: Date) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "HH:mm E, d MMM y"
    return formatter.string(from: date)
}
