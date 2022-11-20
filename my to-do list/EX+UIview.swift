//
//  EX+UIview.swift
//  my to-do list
//
//  Created by Sardor Panjiyev on 19/11/22.
//

import Foundation
import UIKit

extension UIView {
    @IBInspectable var cornerRadius : CGFloat {
        get {return self.layer.cornerRadius}
        set{self.layer.cornerRadius = newValue}
        
    }
}
