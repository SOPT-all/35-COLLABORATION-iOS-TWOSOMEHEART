//
//  ModalView.swift
//  TWOSOMEHEART-iOS
//
//  Created by 이수민 on 11/19/24.
//

import UIKit

import SnapKit
import Then

class ModalView: UIView {
    
    private let headerView : UIView = UIView()
    
    private let headerLabel : UILabel = UILabel()
    
    private let scrollView : UIScrollView = UIScrollView()
    
    private let contentView : UIView = UIView()
    
    private let segmentChoiceView : UIStackView = UIStackView()
    
    private let personalCupButton : UIButton = UIButton()
    
    private let personalCupLabel : UILabel = UILabel()
    
    private let personalCupPriceLabel : UILabel = UILabel()
    
    private let personalCupExplainLabel : UILabel = UILabel()
    
    private let personalOptionButton : UIButton = UIButton()
    
    private let footerView : UIView = UIView()
    
    private var priceLabel : UILabel = UILabel()
    
    private let counterView : CounterView = CounterView(counterType: .modal)
    
    private let shopButton : UIButton = UIButton()
    
    private let starButton : UIButton = UIButton()
    
    private let orderButton : UIButton = UIButton()
    
    init() {
        super.init(frame: .zero)
        
        setHierarchy()
        setLayout()
        setStyle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setHierarchy() {
        self.addSubviews(headerView,
                         scrollView,
                         footerView)
        
        headerView.addSubviews(headerLabel)
        
        scrollView.addSubviews(contentView)
        
        contentView.addSubviews(segmentChoiceView,
                                personalCupLabel,
                                personalCupButton,
                                personalCupPriceLabel,
                                personalCupExplainLabel,
                                personalOptionButton)
        
        footerView.addSubviews(counterView,
                               shopButton,
                               starButton,
                               orderButton)
    }
    
    private func setLayout() {
        headerView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.height.equalTo(55)
        }
        
        headerLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(26)
        }
        
        scrollView.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview()
            $0.top.equalTo(headerView.snp.bottom)
            $0.height.equalTo(572)
        }
        
        contentView.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.verticalEdges.equalToSuperview()
        }
        
        segmentChoiceView.snp.makeConstraints {
            $0.horizontalEdges.top.equalToSuperview()
            $0.height.equalTo(402)
        }
        
        personalCupButton.snp.makeConstraints {
            $0.top.equalTo(segmentChoiceView.snp.bottom).offset(20)
            $0.leading.equalToSuperview()
            $0.height.width.equalTo(20)
        }
        
        personalCupLabel.snp.makeConstraints {
            $0.top.equalTo(segmentChoiceView.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(28)
            $0.height.equalTo(20)
        }
        
        personalCupPriceLabel.snp.makeConstraints {
            $0.top.equalTo(segmentChoiceView.snp.bottom).offset(20)
            $0.trailing.equalToSuperview()
            $0.height.equalTo(20)
        }
        
        personalCupExplainLabel.snp.makeConstraints {
            $0.top.equalTo(personalCupPriceLabel.snp.bottom).offset(16)
            $0.trailing.equalToSuperview()
            $0.height.equalTo(24)
            $0.width.equalTo(111)
        }
        
        personalOptionButton.snp.makeConstraints {
            $0.bottom.horizontalEdges.equalToSuperview()
            $0.height.equalTo(46)
        }
        
        footerView.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.bottom.equalToSuperview()
        }
        
        
    }
    
    private func setStyle() {
        headerLabel.do {
            $0.text = "바닐라 샷 라떼"
        }
        
        scrollView.do {
            $0.backgroundColor = .blue
        }
        
        contentView.do {
            $0.backgroundColor = .red
        }
        
        
        
    }
    
}
