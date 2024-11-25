//
//  CustomSegmentControl.swift
//  TWOSOMEHEART-iOS
//
//  Created by 이수민 on 11/18/24.
//

import UIKit

import SnapKit
import Then

class CustomSegmentControlView: UIView {
    
    private var stackView: UIStackView = UIStackView()
    
    private var buttons: [UIButton]
    
    private var segmentType: SegmentType
    
    private var selectedIndex : Int = -1 {
        didSet {
            updateSegments()
        }
    }
    
    // TODO: - 트슛 작성
    private var isSelected: Bool = false {
        didSet {
            onSelectedStateChanged?(isSelected)
        }
    }
        
    var onSelectedStateChanged: ((Bool) -> Void)?
    
    init(buttons: [UIButton], segmentType: SegmentType) {
        self.buttons = buttons
        self.segmentType = segmentType
        
        super.init(frame: .zero)
        
        self.addSubviews(stackView)
        buttons.forEach { stackView.addArrangedSubview($0) }
        
        setLayout()
        setStyle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setLayout() {
        stackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    private func setStyle() {
        stackView.do {
            switch segmentType {
            case .size, .pickup:
                $0.setStackView(spacing: 0)
            default:
                $0.setStackView(spacing: -1)
            }
        }
        
        buttons.enumerated().forEach { index, button in
            button.do {
                $0.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
                $0.tag = index
                $0.layer.borderWidth = 1
                setPlainButton($0)
                
                if index == 0 {
                    $0.layer.cornerRadius = 5
                    $0.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
                } else if index == buttons.count - 1 {
                    $0.layer.cornerRadius = 5
                    $0.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
                }
            }
        }
        
        switch segmentType {
        case .option:
            updateSegments()
        default:
            return
        }

    }
    
}

private extension CustomSegmentControlView {
    
    @objc
    private func buttonTapped(_ sender: UIButton) {
        guard sender.tag != selectedIndex else { return }
        selectedIndex = sender.tag
        isSelected = true
    }
    
    func updateSegments() {
        buttons.enumerated().forEach { index, button in
            index == selectedIndex ? setSelectedButton(button) : setPlainButton(button)
        }
        
    }
    
}

private extension CustomSegmentControlView {
    
    func setTextStyle(_ button: UIButton, attributes: [NSAttributedString.Key: Any]) {
        button.do {
            if segmentType == .pickup, let currentTitle = $0.currentAttributedTitle {
                let titleComponents = currentTitle.string.components(separatedBy: "\n")
                if titleComponents.count > 1 {
                    let titleParagraphStyle = NSMutableParagraphStyle()
                    titleParagraphStyle.alignment = .center
                    titleParagraphStyle.lineSpacing = 4
                    
                    let attributedString = NSMutableAttributedString(
                        string: titleComponents[0] + "\n",
                        attributes: attributes
                    )
                    
                    let subtitleParagraphStyle = NSMutableParagraphStyle()
                    subtitleParagraphStyle.alignment = .center
                    
                    var subtitleAttributes = attributes
                    subtitleAttributes[.font] = UIFont.systemFont(ofSize: (attributes[.font] as? UIFont)?.pointSize ?? 12 - 2)
                    
                    let subtitleString = NSAttributedString(
                        string: titleComponents[1],
                        attributes: subtitleAttributes
                    )
                    
                    attributedString.append(subtitleString)
                    $0.setAttributedTitle(attributedString, for: .normal)
                }
            } else if let currentTitle = $0.title(for: .normal) {
                let paragraphStyle = NSMutableParagraphStyle()
                paragraphStyle.alignment = .center
                
                var newAttributes = attributes
                newAttributes[.paragraphStyle] = paragraphStyle
                
                let attributedString = NSAttributedString(
                    string: currentTitle,
                    attributes: newAttributes
                )
                $0.setAttributedTitle(attributedString, for: .normal)
            }
        }
    }
    
    func setPlainButton(_ button: UIButton) {
        button.do {
            $0.backgroundColor = UIColor(resource: .tsWhite)
            $0.layer.borderColor = segmentType.borderColor.cgColor
            $0.isSelected = false
        }
        
        let plainTextAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: segmentType.textColor,
            .font: TSFont.c1r
        ]
        setTextStyle(button, attributes: plainTextAttributes)
    }
    
    func setSelectedButton(_ button: UIButton) {
        button.do {
            $0.backgroundColor = segmentType.selectedBackgroundColor[button.tag]
            $0.layer.borderColor = segmentType.selectedBorderColor[button.tag].cgColor
            $0.isSelected = true
        }
        let selectedTextAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: segmentType.selectedTextColor,
            .font: segmentType.selectedTextFont
        ]
        setTextStyle(button, attributes: selectedTextAttributes)
    }
    
}
