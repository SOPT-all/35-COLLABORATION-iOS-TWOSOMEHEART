//
//  CustomSegmentFactory.swift
//  TWOSOMEHEART-iOS
//
//  Created by 이수민 on 11/23/24.
//

import UIKit

class SegmentButtonFactory {
    static func makeSegmentButton(type: SegmentType, title: String, subTitle: String? = nil, image: UIImage? = nil, selectedImage: UIImage? = nil) -> UIButton {
        
        let segmentButton = UIButton()
        segmentButton.titleLabel?.numberOfLines = 0
        segmentButton.titleLabel?.textAlignment = .center
        
        switch type {
        case .size:
            segmentButton.setTitle(title, for: .normal)
            if let image = image {
                let spacing: CGFloat = 8
                segmentButton.setImage(image, for: .normal)
                segmentButton.setImage(selectedImage, for: .selected)
                segmentButton.imageView?.contentMode = .scaleAspectFit
                
                segmentButton.imageEdgeInsets = UIEdgeInsets(
                   top: -spacing,
                   left: 70, // TODO: - 임시 레이아웃 -> 수정필요
                   bottom: 0,
                   right: 0
               )
               
               segmentButton.titleEdgeInsets = UIEdgeInsets(
                   top: 40 + spacing,
                   left: -(segmentButton.imageView?.image?.size.width ?? 0),
                   bottom: 0,
                   right: 0
               )
            }
            
        case .pickup:
            if let subTitle = subTitle {
                let titleParagraphStyle = NSMutableParagraphStyle()
                titleParagraphStyle.alignment = .center
                titleParagraphStyle.lineSpacing = 4
                
                let attributedString = NSMutableAttributedString(
                    string: title + "\n",
                    attributes: [
                        .font: type.textFont,
                        .paragraphStyle: titleParagraphStyle
                    ]
                )
                
                let subtitleParagraphStyle = NSMutableParagraphStyle()
                subtitleParagraphStyle.alignment = .center
                
                let subtitleString = NSAttributedString(
                    string: subTitle,
                    attributes: [
                        .font: UIFont.systemFont(ofSize: type.textFont.pointSize - 2),
                        .paragraphStyle: subtitleParagraphStyle
                    ]
                )
                
                attributedString.append(subtitleString)
                segmentButton.setAttributedTitle(attributedString, for: .normal)
            }
            
        default:
            segmentButton.setTitle(title, for: .normal)
        }
        
        return segmentButton
    }
}
