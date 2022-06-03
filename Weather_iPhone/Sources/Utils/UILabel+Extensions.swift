//
//  UILabel+Extensions.swift
//  Weather_iPhone
//
//  Created by 김수정 on 2022/05/26.
//

import UIKit

extension UILabel {
    /// color와 font 둘 다 변경하는 Extension
    func setFontColor(text: String, font: UIFont, color: UIColor) {
        self.text = text
        self.font = font
        self.textColor = color
    }
}
