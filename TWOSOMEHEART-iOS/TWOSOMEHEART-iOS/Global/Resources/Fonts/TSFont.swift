//
//  TSFont.swift
//  TWOSOMEHEART-iOS
//
//  Created by 이수민 on 11/17/24.
//

import UIKit

enum TSFont {
    private enum FontName {
        static let bold = "AppleSDGothicNeoB00"
        static let semiBold = "AppleSDGothicNeoSB00"
        static let regular = "AppleSDGothicNeoR00"
    }
    
    private static func font(name: String, size: CGFloat, weight: UIFont.Weight) -> UIFont {
        return UIFont(name: name, size: size) ?? .systemFont(ofSize: size, weight: weight)
    }
    
    // MARK: - Heading
    static let h1b = font(name: FontName.bold, size: 24, weight: .bold)
    static let h2b = font(name: FontName.bold, size: 20, weight: .bold)
    static let h2r = font(name: FontName.regular, size: 20, weight: .regular)
    static let h3b = font(name: FontName.bold, size: 17, weight: .bold)
    static let h3r = font(name: FontName.regular, size: 17, weight: .regular)
    
    // MARK: - Title
    static let t1b = font(name: FontName.bold, size: 15, weight: .bold)
    static let t1s = font(name: FontName.semiBold, size: 15, weight: .semibold)
    static let t1r = font(name: FontName.regular, size: 15, weight: .regular)
    
    // MARK: - Body
    static let b1b = font(name: FontName.bold, size: 14, weight: .bold)
    static let b1r = font(name: FontName.regular, size: 14, weight: .regular)
    static let b2b = font(name: FontName.bold, size: 13, weight: .bold)
    static let b2s = font(name: FontName.semiBold, size: 13, weight: .semibold)
    static let b2r = font(name: FontName.regular, size: 13, weight: .regular)
    
    // MARK: - Caption
    static let c1s = font(name: FontName.semiBold, size: 12, weight: .semibold)
    static let c1r = font(name: FontName.regular, size: 12, weight: .regular)
    static let c2b = font(name: FontName.bold, size: 11, weight: .bold)
    static let c2s = font(name: FontName.semiBold, size: 11, weight: .semibold)
    static let c2r = font(name: FontName.regular, size: 11, weight: .regular)
    static let c3r = font(name: FontName.regular, size: 10, weight: .regular)
    
    // MARK: - Button
    static let btn1s = font(name: FontName.semiBold, size: 16, weight: .semibold)
}
