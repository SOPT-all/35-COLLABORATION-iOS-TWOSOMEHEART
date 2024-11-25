//
//  CustomSegmentControl.swift
//  TWOSOMEHEART-iOS
//
//  Created by 이수민 on 11/18/24.
//

import UIKit

import SnapKit
import Then

class CustomSegmentControlView: BaseView {
    
    private var stackView: UIStackView = UIStackView()
    
    private var buttons: [UIButton]
    
    private var segmentType: SegmentType
    
    private var selectedIndex : Int = -1 {
        didSet {
            updateSegments()
            onSelectedStateChanged?(selectedIndex)
        }
    }
    
    // TODO: - 트슛 작성
    var onSelectedStateChanged: ((Int) -> Void)?
    
    init(buttons: [UIButton], segmentType: SegmentType) {
        self.buttons = buttons
        self.segmentType = segmentType
        
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setHierarchy() {
        self.addSubviews(stackView)
        buttons.forEach { stackView.addArrangedSubview($0) }
    }
    
    override func setLayout() {
        stackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    override func setStyle() {
        stackView.do {
            $0.setStackView(spacing: segmentType == .size || segmentType == .pickup ? 0 : -1)
        }
        
        buttons.enumerated().forEach { index, button in
            button.do {
                $0.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
                $0.tag = index
                $0.layer.borderWidth = 1
                $0.layer.cornerRadius = index == 0 || index == buttons.count - 1 ? 5 : 0
                $0.layer.maskedCorners = maskedCorners(for: index)
                setPlainButton($0)
            }
        }
        
        if segmentType == .option { updateSegments() }

    }
    
}

private extension CustomSegmentControlView {
    
    @objc
    private func buttonTapped(_ sender: UIButton) {
        guard sender.tag != selectedIndex else { return }
        selectedIndex = sender.tag
    }
    
    func updateSegments() {
        buttons.enumerated().forEach { index, button in
            index == selectedIndex ? setSelectedButton(button) : setPlainButton(button)
        }
        
    }
    
}

private extension CustomSegmentControlView {
    
    func maskedCorners(for index: Int) -> CACornerMask {
        switch index {
        case 0:
            return [.layerMinXMinYCorner, .layerMinXMaxYCorner]
        case buttons.count - 1:
            return [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
        default:
            return []
        }
    }
    
    //TODO: - setTextStyle 트슛 작성
    func setTextStyle(_ button: UIButton,
                      attributes: [NSAttributedString.Key: Any],
                      subTitleAttributes: [NSAttributedString.Key: Any]) {
        if segmentType == .pickup, let currentTitle = button.currentAttributedTitle {
            let titleComponents = currentTitle.string.components(separatedBy: "\n")

            guard titleComponents.count > 1 else { return }

            let attributedString = NSMutableAttributedString(
                string: titleComponents[0] + "\n",
                attributes: attributes
            )

            let subtitleAttributes = subTitleAttributes
           
            let subtitleString = NSAttributedString(
                string: titleComponents[1],
                attributes: subtitleAttributes
            )

            attributedString.append(subtitleString)
            button.setAttributedTitle(attributedString, for: .normal)
        } else if let currentTitle = button.title(for: .normal) {
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = .center

            var newAttributes = attributes
            newAttributes[.paragraphStyle] = paragraphStyle

            let attributedString = NSAttributedString(
                string: currentTitle,
                attributes: newAttributes
            )

            button.setAttributedTitle(attributedString, for: .normal)
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
        
        let plainSubTitleTextAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: segmentType.textColor,
            .font: TSFont.c2r,
        ]
        
        setTextStyle(button,
                     attributes: plainTextAttributes,
                     subTitleAttributes: plainSubTitleTextAttributes)
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
        
        let selectedSubTitleTextAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: segmentType.selectedTextColor,
            .font: TSFont.c2r,
        ]
        
        setTextStyle(button,
                     attributes: selectedTextAttributes,
                     subTitleAttributes: selectedSubTitleTextAttributes)
    }
    
}
