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
    
    let scrollView : UIScrollView = UIScrollView()
    
    let contentView : UIView = UIView()
    
    let segmentControlStackView : SegmentControlStackView = SegmentControlStackView()
    
    let personalCupButton : UIButton = UIButton()
    
    private let personalCupLabel : UILabel = UILabel()
    
    let personalCupPriceLabel : UILabel = UILabel()
    
    let personalCupExplainLabel : UILabel = UILabel()
    
    private let personalOptionButton : UIButton = UIButton()
    
    private let personalOptionLabel : UILabel = UILabel()
    
    private let rightArrowImageView : UIImageView = UIImageView()
    
    var personalOptionListLabel : UILabel = UILabel()
    
    private let footerView : UIView = UIView()
    
    private let blackLineView : UIView = UIView()
    
    var priceLabel : UILabel = UILabel()
    
    let counterView : CounterView = CounterView(counterType: .modal)
    
    var shopButton : UIButton = UIButton()
    
    var starButton : UIButton = UIButton()
    
    var orderButton : UIButton = UIButton()
    
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
        
        contentView.addSubviews(segmentControlStackView,
                                personalCupLabel,
                                personalCupButton,
                                personalCupPriceLabel,
                                personalCupExplainLabel,
                                personalOptionButton)
        
        personalOptionButton.addSubviews(personalOptionLabel,
                                         rightArrowImageView,
                                         personalOptionListLabel)
        
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
        }
        
        // TODO :- 트슛 작성 : height 정의해서 Segment Button click 가능해짐
        contentView.snp.makeConstraints {
            $0.verticalEdges.equalTo(scrollView.contentLayoutGuide)
            $0.width.equalTo(scrollView.frameLayoutGuide)
            $0.height.equalTo(552)
        }
        
        segmentControlStackView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.height.equalTo(402)
        }
        
        personalCupButton.snp.makeConstraints {
            $0.top.equalTo(segmentControlStackView.snp.bottom).offset(20)
            $0.leading.equalToSuperview().inset(16)
            $0.height.width.equalTo(20)
        }
        
        personalCupLabel.snp.makeConstraints {
            $0.top.equalTo(segmentControlStackView.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(42)
            $0.height.equalTo(20)
        }
        
        personalCupPriceLabel.snp.makeConstraints {
            $0.top.equalTo(segmentControlStackView.snp.bottom).offset(20)
            $0.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(20)
        }
        
        personalCupExplainLabel.snp.makeConstraints {
            $0.top.equalTo(personalCupPriceLabel.snp.bottom).offset(16)
            $0.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(24)
            $0.width.equalTo(111)
        }
        
        personalOptionButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(20)
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.height.equalTo(46)
        }
        
        personalOptionLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(16)
        }
        
        personalOptionListLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(32)
        }
        
        rightArrowImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.height.width.equalTo(24)
            $0.trailing.equalToSuperview().inset(8)
        }
        
        footerView.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.top.equalTo(scrollView.snp.bottom)
            $0.height.equalTo(141)
            //$0.bottom.equalToSuperview().inset(safeAreaInsets.bottom)
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
        self.backgroundColor = UIColor(resource: .tsWhite)
        headerLabel.do {
            $0.setLabel(text: "바닐라샷라떼",
                        alignment: .center,
                        textColor: UIColor(resource: .tsBlack),
                        font: TSFont.b1b)
        }
        
        personalCupButton.do {
            $0.setImage(UIImage(resource: .modalCheckboxDeselect), for: .normal)
            $0.setImage(UIImage(resource: .modalCheckboxSelect), for: .selected)
        }
        
        personalCupLabel.do {
            $0.setLabel(text: "개인컵 사용",
                        textColor: UIColor(resource: .tsBlack),
                        font: TSFont.b2r)
        }
        
        personalCupPriceLabel.do {
            $0.setLabel(text: "-300원",
                        textColor: UIColor(resource: .blue20),
                        font: TSFont.b2r)
            $0.isHidden = true
        }
        
        personalCupExplainLabel.do {
            $0.setLabel(text: "개인컵 사용 안내 >",
                        textColor: UIColor(resource: .gray50),
                        font: TSFont.b2s)
            $0.isHidden = true
        }
        
        personalOptionButton.do {
            $0.layer.cornerRadius = 4
            $0.layer.borderWidth = 1
            $0.layer.borderColor = UIColor(resource: .red20).cgColor
            
            $0.backgroundColor = UIColor(resource: .red10)
        }
        
        personalOptionLabel.do {
            $0.setLabel(text: "퍼스널 옵션",
                        textColor: UIColor(resource: .tsBlack),
                        font: TSFont.b2r)
        }
        
        rightArrowImageView.do {
            $0.image = UIImage(resource: .modalArrowRight)
        }
        
        personalOptionListLabel.do {
            $0.setLabel(textColor: UIColor(resource: .red40), font: TSFont.c3r)
        }
        
        blackLineView.do {
            $0.backgroundColor = UIColor(resource: .tsBlack)
        }
        
        priceLabel.do {
            $0.setLabel(alignment: .center,
                        textColor: UIColor(resource: .tsBlack),
                        font: TSFont.h3b)
        }
        
        counterView.do {
            $0.numberCount = 1
        }
        
        shopButton.do {
            $0.isEnabled = false
            $0.setImage(.modalShopDisable, for: .disabled)
            $0.setImage(.modalShopAble, for: .normal)
            $0.backgroundColor = UIColor(resource: .red40).withAlphaComponent(0.4)
        }
        
        starButton.do {
            $0.isEnabled = false
            $0.setImage(.modalStarDisable, for: .disabled)
            $0.setImage(.modalStarAble, for: .normal)
            $0.layer.borderColor = UIColor(resource: .red40).withAlphaComponent(0.4).cgColor
            $0.layer.borderWidth = 1
        }
        
        orderButton.do {
            $0.setTitle("주문하기", for: .normal)
            $0.titleLabel?.font = TSFont.btn1s
            $0.titleLabel?.textColor = UIColor(resource: .gray50)
            $0.backgroundColor = UIColor(resource: .gray20)
        }
        
    }
    
}
