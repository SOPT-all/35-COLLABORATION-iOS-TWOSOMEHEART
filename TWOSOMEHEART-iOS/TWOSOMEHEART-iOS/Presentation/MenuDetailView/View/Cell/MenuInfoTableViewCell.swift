//
//  MenuInfoTableViewCell.swift
//  TWOSOMEHEART-iOS
//
//  Created by 김예지 on 11/22/24.
//

import UIKit

class MenuInfoTableViewCell: BaseTableViewCell {
    
    // MARK: - UI Components
    
    private let menuImageView = UIImageView()
    private let statusLabel = UILabel()
    private let menuNameLabel = UILabel()
    private let menuDescriptionLabel = UILabel()
    private let priceLabel = UILabel()
    private let cautionLabel = UILabel()
    private let cautionLabel2 = UILabel()
    private let seperatorLineView = UIView()
    
    // MARK: - Style, UI, Layout
    override func setStyle(){
        menuImageView.do{
            $0.image = UIImage(resource: .imgDetail)
            $0.contentMode = .scaleAspectFill
        }
        
        statusLabel.do {
            $0.setLabel(
                alignment: .center,
                textColor: .tsWhite,
                font: TSFont.c3r
            )
            
            $0.backgroundColor = UIColor(resource: .red40)
            $0.layer.cornerRadius = 2
            $0.clipsToBounds = true
        }
        
        menuNameLabel.do {
            $0.setLabel(
                alignment: .center,
                textColor: .tsBlack,
                font: TSFont.h2b
            )
        }
        
        menuDescriptionLabel.do {
            $0.setLabel(
                alignment: .center,
                textColor: .tsBlack,
                font: TSFont.b1r
            )
        }
        
        priceLabel.do{
            $0.setLabel(
                alignment: .center,
                textColor: .tsBlack,
                font : TSFont.h1b
            )
        }
        
        cautionLabel.do {
            $0.setLabel(
                alignment: .center,
                textColor: .gray10,
                font: TSFont.c2b
            )
            
            $0.backgroundColor = UIColor(resource: .red30)
            $0.layer.cornerRadius = 2
            $0.clipsToBounds = true
        }
        
        cautionLabel2.do {
            $0.setLabel(
                alignment: .center,
                textColor: .gray10,
                font: TSFont.c2b
            )
            
            $0.backgroundColor = UIColor(resource: .gray70)
            $0.layer.cornerRadius = 2
            $0.clipsToBounds = true
        }
        
        seperatorLineView.do {
            $0.backgroundColor = UIColor(resource: .gray20)
        }
    }
    
    override func setHierarchy(){
        contentView.addSubviews(menuImageView,
                                statusLabel,
                                menuNameLabel,
                                menuDescriptionLabel,
                                priceLabel,
                                cautionLabel,
                                cautionLabel2,
                                seperatorLineView
        )
    }
    
    override func setLayout(){
        menuImageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(375)
        }
        
        statusLabel.snp.makeConstraints {
            $0.top.equalTo(menuImageView.snp.bottom).offset(22)
            $0.leading.equalToSuperview().offset(16)
            $0.width.equalTo(28)
            $0.height.equalTo(15)
        }
        
        menuNameLabel.snp.makeConstraints {
            $0.top.equalTo(statusLabel.snp.bottom).offset(5)
            $0.leading.equalToSuperview().offset(16)
        }
        
        menuDescriptionLabel.snp.makeConstraints {
            $0.top.equalTo(menuNameLabel.snp.bottom).offset(5)
            $0.leading.equalToSuperview().offset(22)
        }
        
        priceLabel.snp.makeConstraints {
            $0.top.equalTo(menuDescriptionLabel.snp.bottom).offset(24.5)
            $0.leading.equalToSuperview().offset(16)
        }
        
        cautionLabel.snp.makeConstraints {
            $0.top.equalTo(priceLabel.snp.bottom).offset(24.5)
            $0.leading.equalToSuperview().offset(16)
            $0.width.equalTo(51)
            $0.height.equalTo(20)
        }
        
        cautionLabel2.snp.makeConstraints {
            $0.top.equalTo(priceLabel.snp.bottom).offset(24.5)
            $0.leading.equalTo(cautionLabel.snp.trailing).offset(5)
            $0.width.equalTo(32)
            $0.height.equalTo(20)
        }
        
        seperatorLineView.snp.makeConstraints {
            $0.top.equalTo(cautionLabel2.snp.bottom).offset(12)
            $0.horizontalEdges.bottom.equalToSuperview()
            $0.height.equalTo(4)
        }
    }
    
    // MARK: - Helper
    private func configureCautionLabels(with caution: [CautionType]){
        cautionLabel.isHidden = caution.isEmpty
        cautionLabel.text = caution[0].rawValue
        cautionLabel2.isHidden = caution.count <= 1
        cautionLabel2.text = caution.count > 1 ? caution[1].rawValue : nil
    }
    
    // MARK: - Bind
    func bind(_ menuDetail: MenuDetail) {
        menuImageView.image = menuDetail.imageURL
        statusLabel.text = menuDetail.status.rawValue
        menuNameLabel.text = menuDetail.name
        menuDescriptionLabel.text = menuDetail.description
        priceLabel.text = "\(menuDetail.price.formattedPrice())원"
        configureCautionLabels(with: menuDetail.caution)
    }
}
