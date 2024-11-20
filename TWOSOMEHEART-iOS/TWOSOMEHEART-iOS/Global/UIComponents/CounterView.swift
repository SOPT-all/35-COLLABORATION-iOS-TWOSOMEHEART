//
//  CounterView.swift
//  TWOSOMEHEART-iOS
//
//  Created by 이수민 on 11/18/24.
//

import UIKit

import SnapKit
import Then

class CounterView : UIView {

    private var stackView: UIStackView = UIStackView()
    
    private var minusButton: UIButton = UIButton()
    
    private var countLabel: UILabel = UILabel()
    
    private let plusButton: UIButton = UIButton()
    
    private var numberCount: Int = 0 {
        didSet {
            updateUI()
        }
    }
    
    private var counterType: CounterType
    
    init(counterType: CounterType) {
        self.counterType = counterType
        
        super.init(frame: .zero)
        
        setHierachy()
        setLayout()
        setStyle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setHierachy() {
        self.addSubviews(stackView)
        
        stackView.addSubviews(minusButton,
                              countLabel,
                              plusButton)
    }
    
    func setLayout() {
        stackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        minusButton.snp.makeConstraints {
            $0.verticalEdges.leading.equalToSuperview()
            $0.width.equalToSuperview().multipliedBy(0.31)
        }
        
        countLabel.snp.makeConstraints {
            $0.verticalEdges.centerX.equalToSuperview()
            $0.width.equalToSuperview().multipliedBy(0.38)
        }
        
        plusButton.snp.makeConstraints {
            $0.verticalEdges.trailing.equalToSuperview()
            $0.width.equalToSuperview().multipliedBy(0.31)
        }
    }
    
    func setStyle() {
        stackView.do {
            $0.setStackView(spacing: -1)
        }
        
        for views in stackView.arrangedSubviews {
            views.do {
                $0.backgroundColor = UIColor(resource: .tsWhite)
            }
        }
        
        minusButton.do {
            $0.layer.cornerRadius = 5
            $0.layer.borderWidth = 1
            $0.layer.borderColor = UIColor(resource: .gray20).cgColor
            $0.setImage(counterType.minusImage, for: .normal)
            $0.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
            $0.isEnabled = false
            
            $0.addAction(UIAction { [weak self] _ in
                                    self?.updateNumberCount(-1)},
                         for: .touchUpInside)
        }
        
        countLabel.do {
            $0.layer.borderWidth = 1
            $0.layer.borderColor = UIColor(resource: .gray20).cgColor
            $0.font = counterType.countLabelFont
            $0.textColor = UIColor(resource: .tsBlack)
            $0.textAlignment = .center
            $0.text = "\(0)"
        }
        
        plusButton.do {
            $0.layer.cornerRadius = 5
            $0.layer.borderWidth = 1
            $0.layer.borderColor = UIColor(resource: .gray20).cgColor
            $0.setImage(counterType.plusImage, for: .normal)
            $0.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
            $0.addAction(UIAction { [weak self] _ in
                                    self?.updateNumberCount(1)},
                         for: .touchUpInside)
        }
    }

}

extension CounterView {
    
    @objc
    func updateNumberCount(_ change: Int) {
        numberCount += change
    }
    
    func updateUI() {
        countLabel.text = "\(numberCount)"
        minusButton.isEnabled = (numberCount != 0)
    }
    
}
