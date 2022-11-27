//
//  PriorityEnum.swift
//  my to-do list
//
//  Created by Sardor Panjiyev on 22/11/22.
//

import Foundation
import UIKit


enum PriorityEnum {
    case  high, medium, low , none
    
    func setPrioriyColor()-> UIColor {
        switch self {
        case .high :
            return .systemRed
        case .medium:
            return .systemOrange
        case .low:
            return .systemGreen
        case .none:
            return .systemGray6

        }
    }
    
}
