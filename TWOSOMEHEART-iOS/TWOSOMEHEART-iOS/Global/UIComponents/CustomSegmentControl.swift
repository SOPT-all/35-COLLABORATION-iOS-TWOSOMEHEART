//
//  CustomSegmentControl.swift
//  TWOSOMEHEART-iOS
//
//  Created by 이수민 on 11/18/24.
//

import UIKit

import SnapKit
import Then

class CustomSegmentControl: UIView {
    
    private var stackView: UIStackView = UIStackView()
    
    private var buttons: [UIButton]
    
    private var segmentType: SegmentType
    
    private var selectedIndex : Int = 0 {
        didSet {
            updateSegments()
        }
    }
    
    private var onSegmentSelect: ((Int)->Void)?
    
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
            $0.axis = .horizontal
            $0.distribution = .fillEqually
            $0.alignment = .fill
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        buttons.enumerated().forEach { index, button in
            button.do {
                $0.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
                $0.tag = index
            }
        }
        
        updateSegments()

    }
    
}

private extension CustomSegmentControl {
    
    @objc
    func buttonTapped(_ sender: UIButton) {
        selectedIndex = sender.tag
        onSegmentSelect?(sender.tag)
    }
    
    func updateSegments() {
        buttons.enumerated().forEach { index, button in
            index == selectedIndex ? setSelectedButton(button) : setPlainButton(button)
        }
        
    }
}

private extension CustomSegmentControl {
    
    func setTextStyle(_ button: UIButton, attributes: [NSAttributedString.Key: Any]) {
        button.do {
            if let title = $0.title(for: .normal) {
                let attributedTitle = NSAttributedString(string: title, attributes: attributes)
                $0.setAttributedTitle(attributedTitle, for: .normal)
            }
        }
    }
    
    func setPlainButton(_ button: UIButton) {
        button.do {
            $0.backgroundColor = UIColor(resource: .white)
            $0.layer.borderColor = segmentType.borderColor.cgColor
            $0.layer.cornerRadius = 5
            $0.layer.borderWidth = 1
        }
        
        let plainTextAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: segmentType.textColor,
            .font: TSFont.c1r
        ]
        setTextStyle(button, attributes: plainTextAttributes)
    }
    
    func setSelectedButton(_ button: UIButton) {
        button.do {
            $0.backgroundColor = segmentType.selectedBackgroundColor
            $0.layer.borderColor = segmentType.selectedBackgroundColor.cgColor
            $0.layer.cornerRadius = 5
            $0.layer.borderWidth = 1
        }
        let selectedTextAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor(resource: .white),
            .font: segmentType.selectedTextFont
        ]
        setTextStyle(button, attributes: selectedTextAttributes)
    }
    
}