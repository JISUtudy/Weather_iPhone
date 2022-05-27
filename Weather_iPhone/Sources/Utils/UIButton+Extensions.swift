//
//  UIButton + Extensions.swift
//  Weather_iPhone
//
//  Created by 김수정 on 2022/05/28.
//

import UIKit

extension UIButton {
    // 버튼에 밑줄
    func setUnderline() {
        guard let title = title(for: .normal) else { return }
        let attributedString = NSMutableAttributedString(string: title)
        attributedString.addAttribute(.underlineStyle,
                                      value: NSUnderlineStyle.single.rawValue,
                                      range: NSRange(location: 0, length: title.count)
        )
        setAttributedTitle(attributedString, for: .normal)
    }
    
    // color와 font 둘 다 변경하는 Extension
    func setBtnFontColor(text: String, font: UIFont, color: UIColor) {
        self.setTitle(text, for: .normal)
        self.titleLabel?.font = font
        self.setTitleColor(color, for: .normal)
    }
    
}
