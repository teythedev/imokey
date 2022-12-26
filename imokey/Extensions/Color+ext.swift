//
//  Color+ext.swift
//  imokey
//
//  Created by Tugay on 26.12.2022.
//

import UIKit

extension UIColor {
    static var bgColor: UIColor? {
        get {
            return UIColor(named: "bgColor")
        }
    }
    
    static var textColor: UIColor? {
        get {
            return UIColor(named: "textColor")
        }
    }
}
