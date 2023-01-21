//
//  Font + ext.swift
//  KudaGo
//
//  Created by Bohdan Hawrylyshyn on 21.01.23.
//

import SwiftUI

enum FontWeight: String {
    case thin                   = "SFPro-Thin"
    case ultraLight             = "SFPro-Ultralight"
    case light                  = "SFPro-Light"
    case regular                = "SFPro-Regular"
    case medium                 = "SFPro-Medium"
    case semibold               = "SFPro-Semibold"
    case bold                   = "SFPro-Bold"
    case heavy                  = "SFPro-Heavy"
    case black                  = "SFPro-Black"
}

extension Font {
    static func customFont(weight: FontWeight, size: CGFloat) -> Font {
        return .custom(weight.rawValue, size: size)
    }
}
