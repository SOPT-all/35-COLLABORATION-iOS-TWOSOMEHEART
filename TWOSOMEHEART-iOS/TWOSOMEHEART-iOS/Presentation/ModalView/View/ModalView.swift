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
    
    private let blackLineView : UIView = UIView()
    
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
        
        footerView.addSubviews(blackLineView,
                               priceLabel,
                               counterView,
                               shopButton,
                               starButton,
                               orderButton)
    }
    
    private func setLayout() {
        headerView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(55)
        }
        
        headerLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(26)
        }
        
        scrollView.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview()
            $0.top.equalTo(headerView.snp.bottom)
            $0.bottom.equalToSuperview().inset(139)
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
            $0.top.equalTo(scrollView.snp.bottom)
            $0.bottom.equalToSuperview().inset(safeAreaInsets.bottom)
        }
        
        blackLineView.snp.makeConstraints{
            $0.top.width.equalToSuperview()
            $0.height.equalTo(1)
        }
        
        priceLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(14)
            $0.leading.equalToSuperview()
            $0.height.equalTo(48)
        }
        
        counterView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(21)
            $0.trailing.equalToSuperview()
            $0.width.equalTo(100)
            $0.height.equalTo(31)
        }
        
        shopButton.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.bottom.equalToSuperview().inset(12)
            $0.width.equalTo(57)
            $0.height.equalTo(54)
        }
        
        starButton.snp.makeConstraints {
            $0.leading.equalTo(shopButton.snp.trailing).offset(8)
            $0.bottom.equalToSuperview().inset(12)
            $0.width.equalTo(57)
            $0.height.equalTo(54)
        }
        
        orderButton.snp.makeConstraints {
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview().inset(12)
            $0.leading.equalTo(starButton.snp.trailing).offset(8)
            $0.height.equalTo(54)
        }
        
    }
    
    private func setStyle() {
        headerLabel.do {
            $0.setLabel(text: "바닐라샷라떼",
                        alignment: .center,
                        textColor: UIColor(resource: .tsBlack),
                        font: TSFont.b1b)
        }
        
        scrollView.do {
            $0.backgroundColor = .blue
        }
        
        contentView.do {
            $0.backgroundColor = .red
        }
        
        blackLineView.do {
            $0.backgroundColor = UIColor(resource: .tsBlack)
        }
        
        priceLabel.do {
            $0.setLabel(text: "5900원",
                        alignment: .center,
                        textColor: UIColor(resource: .tsBlack),
                        font: TSFont.h3b)
        }
        
        shopButton.do {
            $0.setImage(.modalShopDisable, for: .disabled)
            $0.setImage(.modalShopAble, for: .normal)
            $0.backgroundColor = UIColor(resource: .red40)
        }
        
        starButton.do {
            $0.setImage(.modalStarDisable, for: .disabled)
            $0.setImage(.modalStarAble, for: .normal)
            $0.layer.borderColor = UIColor(resource: .red40).cgColor
            $0.layer.borderWidth = 1
        }
        
        orderButton.do {
            $0.backgroundColor = UIColor(resource: .tsBlack)
            $0.setTitle("주문하기", for: .normal)
            $0.titleLabel?.font = TSFont.btn1s
            $0.titleLabel?.textColor = UIColor(resource: .tsWhite)
        }
        
        
        
    }
    
}
