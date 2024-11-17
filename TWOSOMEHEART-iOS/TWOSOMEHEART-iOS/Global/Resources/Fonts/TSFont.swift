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
    static let head1_b_24 = font(name: FontName.bold, size: 24, weight: .bold)
    static let head2_b_20 = font(name: FontName.bold, size: 20, weight: .bold)
    static let head2_r_20 = font(name: FontName.regular, size: 20, weight: .regular)
    static let head3_b_17 = font(name: FontName.bold, size: 17, weight: .bold)
    static let head3_r_17 = font(name: FontName.regular, size: 17, weight: .regular)
    
    // MARK: - Title
    static let title1_b_15 = font(name: FontName.bold, size: 15, weight: .bold)
    static let title1_sb_15 = font(name: FontName.semiBold, size: 15, weight: .semibold)
    static let title1_r_15 = font(name: FontName.regular, size: 15, weight: .regular)
    
    // MARK: - Body
    static let body1_b_14 = font(name: FontName.bold, size: 14, weight: .bold)
    static let body1_r_14 = font(name: FontName.regular, size: 14, weight: .regular)
    static let body2_b_13 = font(name: FontName.bold, size: 13, weight: .bold)
    static let body2_sb_13 = font(name: FontName.semiBold, size: 13, weight: .semibold)
    static let body2_sb_13_relax = font(name: FontName.semiBold, size: 13, weight: .semibold)
    static let body2_r_13 = font(name: FontName.regular, size: 13, weight: .regular)
    
    // MARK: - Caption
    static let caption1_sb_12 = font(name: FontName.semiBold, size: 12, weight: .semibold)
    static let caption1_r_12 = font(name: FontName.regular, size: 12, weight: .regular)
    static let caption1_r_12_relax = font(name: FontName.regular, size: 12, weight: .regular)
    static let caption1_r_12_tight = font(name: FontName.regular, size: 12, weight: .regular)
    static let caption2_b_11 = font(name: FontName.bold, size: 11, weight: .bold)
    static let caption2_sb_11 = font(name: FontName.semiBold, size: 11, weight: .semibold)
    static let caption2_r_11 = font(name: FontName.regular, size: 11, weight: .regular)
    static let caption3_r_10 = font(name: FontName.regular, size: 10, weight: .regular)
    
    // MARK: - Button
    static let button1_sb_16 = font(name: FontName.semiBold, size: 16, weight: .semibold)
}
