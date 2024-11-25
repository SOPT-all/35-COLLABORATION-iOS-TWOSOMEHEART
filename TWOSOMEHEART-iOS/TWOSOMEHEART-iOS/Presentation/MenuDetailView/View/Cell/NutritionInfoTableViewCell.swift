//
//  NutritionInfoTableViewCell.swift
//  TWOSOMEHEART-iOS
//
//  Created by 김예지 on 11/22/24.
//

import UIKit

class NutritionInfoTableViewCell: BaseTableViewCell {
    // MARK: - UI Components
    private let temperatureSegmentControl = UISegmentedControl()
    private let sizeSegmentControl = UISegmentedControl()
    
    private let temperatureSeperatorLineView = UIView()
    private let sizeSeperatorLineView = UIView()
    
    private let temperatureUnderLineView = UIView()
    private let sizeUnderLineView = UIView()
    
    private let nutritionTextLabel = UILabel()
    private let nutritionSeperatorLineView = UIView()
    
    private let noticeStackView = UIStackView()
    private let noticeLabel1 = UILabel()
    private let noticeLabel2 = UILabel()
    private let noticeLabel3 = UILabel()
    
    private let seperatorLineView = UIView()
    
    // MARK: - UI
    override func setStyle() {
        configureSegmentControl(
            temperatureSegmentControl,
            items: [SLMenuDetail.temperatureHot, SLMenuDetail.temperatureIce],
            selectedFont: TSFont.t1b,
            defaultFont: TSFont.t1r,
            defaultColor: UIColor(resource: .gray90),
            action: #selector(temperatureSegmentChanged)
        )
        
        configureSegmentControl(
            sizeSegmentControl,
            items: [SLMenuDetail.sizeRegular, SLMenuDetail.sizeLarge],
            selectedFont: TSFont.b2b,
            defaultFont: TSFont.b2r,
            defaultColor: UIColor(resource: .gray60),
            action: #selector(sizeSegmentChanged)
        )
        
        temperatureSeperatorLineView.do {
            $0.backgroundColor = UIColor(resource: .gray20)
        }
        
        sizeSeperatorLineView.do {
            $0.backgroundColor = UIColor(resource: .gray10)
        }
        
        temperatureUnderLineView.do {
            $0.backgroundColor = UIColor(resource: .tsBlack)
        }
        
        sizeUnderLineView.do {
            $0.backgroundColor = UIColor(resource: .red40)
        }
        
        nutritionTextLabel.do {
            $0.setLabel(
                numberOfLines: 0,
                textColor: .gray80,
                font: TSFont.b2r
            )
        }
        
        nutritionSeperatorLineView.do {
            $0.backgroundColor = UIColor(resource: .gray30)
        }
        
        noticeStackView.setStackView(axis: .vertical, distribution: .fill ,spacing: 10)
        
        noticeLabel1.do {
            $0.setLabel(
                alignment: .left,
                numberOfLines: 0,
                textColor: .gray60,
                font: TSFont.b2r
            )
            $0.attributedText = SLMenuDetail.noticeText1.setLineSpacing(3)
        }
        
        noticeLabel2.do {
            $0.setLabel(
                text: SLMenuDetail.noticeText2,
                alignment: .left,
                numberOfLines: 0,
                textColor: .gray60,
                font: TSFont.b2r
            )
        }
        
        noticeLabel3.do {
            $0.setLabel(
                text: SLMenuDetail.noticeText3,
                alignment: .left,
                numberOfLines: 0,
                textColor: .gray60,
                font: TSFont.b2r
            )
        }
        
        seperatorLineView.do {
            $0.backgroundColor = UIColor(resource: .gray30)
        }
    }
    
    
    override func setHierarchy() {
        noticeStackView
            .addArrangedSubviews(
                [
                    noticeLabel1,
                    noticeLabel2,
                    noticeLabel3
                ]
            )
        
        contentView.addSubviews(
            temperatureSegmentControl,
            temperatureUnderLineView,
            temperatureSeperatorLineView,
            sizeSegmentControl,
            sizeUnderLineView,
            sizeSeperatorLineView,
            nutritionTextLabel,
            nutritionSeperatorLineView,
            noticeStackView,
            seperatorLineView
        )
    }
    
    override func setLayout() {
        temperatureSegmentControl.snp.makeConstraints{
            $0.top.equalToSuperview()
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.height.equalTo(42)
        }
        
        temperatureUnderLineView.snp.makeConstraints{
            $0.top.equalTo(temperatureSegmentControl.snp.bottom)
            $0.height.equalTo(2)
            $0.width.equalTo(temperatureSegmentControl.snp.width).dividedBy(temperatureSegmentControl.numberOfSegments)
            $0.leading.equalTo(temperatureSegmentControl)
        }
        
        temperatureSeperatorLineView.snp.makeConstraints {
            $0.top.equalTo(temperatureUnderLineView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(1)
        }
        
        sizeSegmentControl.snp.makeConstraints {
            $0.top.equalTo(temperatureSeperatorLineView.snp.bottom).offset(12)
            $0.leading.equalToSuperview().inset(16)
            $0.height.equalTo(38)
        }
        
        sizeUnderLineView.snp.makeConstraints{
            $0.top.equalTo(sizeSegmentControl.snp.bottom)
            $0.height.equalTo(1)
            $0.width.equalTo(sizeSegmentControl.snp.width).dividedBy(sizeSegmentControl.numberOfSegments)
            $0.leading.equalTo(sizeSegmentControl)
        }
        
        sizeSeperatorLineView.snp.makeConstraints {
            $0.top.equalTo(sizeUnderLineView.snp.bottom)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(1)
        }
        
        nutritionTextLabel.snp.makeConstraints{
            $0.top.equalTo(sizeSeperatorLineView.snp.bottom).offset(18)
            $0.horizontalEdges.equalToSuperview().inset(16)
        }
        
        nutritionSeperatorLineView.snp.makeConstraints {
            $0.top.equalTo(nutritionTextLabel.snp.bottom).offset(27)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(1)
        }
        
        noticeStackView.snp.makeConstraints{
            $0.top.equalTo(nutritionSeperatorLineView.snp.bottom).offset(13)
            $0.horizontalEdges.equalToSuperview().inset(16)
        }
        
        seperatorLineView.snp.makeConstraints{
            $0.top.equalTo(noticeStackView.snp.bottom).offset(62)
            $0.horizontalEdges.bottom.equalToSuperview()
            $0.height.equalTo(4)
        }
    }
    
    // MARK: - Actions
    @objc private func temperatureSegmentChanged() {
        UIView.animate(withDuration: 0.3) {
            self.temperatureUnderLineView.snp.updateConstraints {
                $0.leading.equalTo(self.temperatureSegmentControl.snp.leading)
                    .offset(CGFloat(self.temperatureSegmentControl.selectedSegmentIndex) * (self.temperatureSegmentControl.frame.width / CGFloat(self.temperatureSegmentControl.numberOfSegments)))
            }
            self.layoutIfNeeded()
        }
    }
    
    @objc private func sizeSegmentChanged() {
        UIView.animate(withDuration: 0.3) {
            self.sizeUnderLineView.snp.updateConstraints {
                $0.leading.equalTo(self.sizeSegmentControl.snp.leading)
                    .offset(CGFloat(self.sizeSegmentControl.selectedSegmentIndex) * (self.sizeSegmentControl.frame.width / CGFloat(self.sizeSegmentControl.numberOfSegments)))
            }
            self.layoutIfNeeded()
        }
    }
    
    // MARK: - SegmentControl
    private func configureSegmentControl(
        _ segmentControl: UISegmentedControl,
        items: [String],
        selectedFont: UIFont,
        defaultFont: UIFont,
        defaultColor: UIColor,
        action: Selector
    ) {
        for (index, item) in items.enumerated() {
            segmentControl.insertSegment(withTitle: item, at: index, animated: true)
        }
        segmentControl.selectedSegmentIndex = 0
        segmentControl.selectedSegmentTintColor = .clear
        segmentControl.setBackgroundImage(UIImage(), for: .normal, barMetrics: .default)
        segmentControl.setDividerImage(UIImage(), forLeftSegmentState: .normal, rightSegmentState: .normal, barMetrics: .default)
        segmentControl.setTitleTextAttributes([
            .font: defaultFont,
            .foregroundColor: defaultColor
        ], for: .normal)
        segmentControl.setTitleTextAttributes([
            .font: selectedFont
        ], for: .selected)
        segmentControl.addTarget(self, action: action, for: .valueChanged)
    }
    
    // MARK: - Bind
    func bind(_ menuItem: MenuDetail) {
        let formattedNutritionText = menuItem.nutrition.setLineSpacing(19)
        nutritionTextLabel.attributedText = formattedNutritionText
    }
}
