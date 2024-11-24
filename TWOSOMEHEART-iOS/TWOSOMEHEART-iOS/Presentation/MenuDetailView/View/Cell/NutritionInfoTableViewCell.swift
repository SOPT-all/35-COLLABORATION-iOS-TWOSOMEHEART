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
    
    private let temperatureSeperateLineView = UIView()
    private let sizeSeperateLineView = UIView()
    
    private let temperatureUnderLineView = UIView()
    private let sizeUnderLineView = UIView()
    
    private let nutritionTextLabel = UILabel()
    private let nutritionSeperateLineView = UIView()
    
    private let noticeStackView = UIStackView()
    private let noticeLabel1 = UILabel()
    private let noticeLabel2 = UILabel()
    private let noticeLabel3 = UILabel()
    
    private let seperateLineView = UIView()
    
    // MARK: - Properties
    private var menuItems: MenuDetail?
    
    // MARK: - Initializer
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI
    override func setStyle() {
        temperatureSegmentControl.do {
            $0.insertSegment(withTitle: SLMenuDetail.temperatureHot, at: 0, animated: true)
            $0.insertSegment(withTitle: SLMenuDetail.temperatureIce, at: 1, animated: true)
            $0.selectedSegmentIndex = 0
            $0.selectedSegmentTintColor = .clear
            $0.setBackgroundImage(UIImage(), for: .normal, barMetrics: .default)
            $0.setDividerImage(UIImage(), forLeftSegmentState: .normal, rightSegmentState: .normal, barMetrics: .default)
            $0.setTitleTextAttributes([
                NSAttributedString.Key.font: TSFont.t1r,
                .foregroundColor: UIColor(resource: .gray90)
                
            ], for: .normal)
            $0.setTitleTextAttributes([
                NSAttributedString.Key.font: TSFont.t1b
            ], for: .selected)
            $0.addTarget(self, action: #selector(temperatureSegmentChanged), for: .valueChanged)
        }
        
        sizeSegmentControl.do {
            $0.insertSegment(withTitle: SLMenuDetail.sizeRegular, at: 0, animated: true)
            $0.insertSegment(withTitle: SLMenuDetail.sizeLarge, at: 1, animated: true)
            $0.selectedSegmentIndex = 0
            $0.selectedSegmentTintColor = .clear
            $0.setBackgroundImage(UIImage(), for: .normal, barMetrics: .default)
            $0.setDividerImage(UIImage(), forLeftSegmentState: .normal, rightSegmentState: .normal, barMetrics: .default)
            
            $0.setTitleTextAttributes([
                NSAttributedString.Key.font: TSFont.b2r,
                .foregroundColor: UIColor(resource: .gray60)
            ], for: .normal)
            $0.setTitleTextAttributes([
                NSAttributedString.Key.font: TSFont.b2b
            ], for: .selected)
            $0.addTarget(self, action: #selector(sizeSegmentChanged), for: .valueChanged)
        }
        
        temperatureSeperateLineView.do {
            $0.backgroundColor = UIColor(resource: .gray20)
        }
        
        sizeSeperateLineView.do {
            $0.backgroundColor = UIColor(resource: .gray10)
        }
        
        temperatureUnderLineView.do {
            $0.backgroundColor = UIColor(resource: .tsBlack)
        }
        
        sizeUnderLineView.do {
            $0.backgroundColor = UIColor(resource: .red40)
        }
        
        nutritionTextLabel.do {
            $0.numberOfLines = 0
            $0.font = TSFont.b2r
            $0.textColor = UIColor(resource: .gray80)
        }
        
        nutritionSeperateLineView.do {
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
        
        seperateLineView.do {
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
            temperatureSeperateLineView,
            sizeSegmentControl,
            sizeUnderLineView,
            sizeSeperateLineView,
            nutritionTextLabel,
            nutritionSeperateLineView,
            noticeStackView,
            seperateLineView
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
        
        temperatureSeperateLineView.snp.makeConstraints {
            $0.top.equalTo(temperatureUnderLineView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(1)
        }
        
        sizeSegmentControl.snp.makeConstraints {
            $0.top.equalTo(temperatureSeperateLineView.snp.bottom).offset(12)
            $0.leading.equalToSuperview().inset(16)
            $0.height.equalTo(38)
        }
        
        sizeUnderLineView.snp.makeConstraints{
            $0.top.equalTo(sizeSegmentControl.snp.bottom)
            $0.height.equalTo(1)
            $0.width.equalTo(sizeSegmentControl.snp.width).dividedBy(sizeSegmentControl.numberOfSegments)
            $0.leading.equalTo(sizeSegmentControl)
        }
        
        sizeSeperateLineView.snp.makeConstraints {
            $0.top.equalTo(sizeUnderLineView.snp.bottom)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(1)
        }
        
        nutritionTextLabel.snp.makeConstraints{
            $0.top.equalTo(sizeSeperateLineView.snp.bottom).offset(18)
            $0.horizontalEdges.equalToSuperview().inset(16)
        }
        
        nutritionSeperateLineView.snp.makeConstraints {
            $0.top.equalTo(nutritionTextLabel.snp.bottom).offset(27)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(1)
        }
        
        noticeStackView.snp.makeConstraints{
            $0.top.equalTo(nutritionSeperateLineView.snp.bottom).offset(13)
            $0.horizontalEdges.equalToSuperview().inset(16)
        }
        
        seperateLineView.snp.makeConstraints{
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
    
    // MARK: - Bind
    func bind(_ menuItem: MenuDetail) {
        let formattedNutritionText = menuItem.nutrition.setLineSpacing(19)
        nutritionTextLabel.attributedText = formattedNutritionText
    }
}
