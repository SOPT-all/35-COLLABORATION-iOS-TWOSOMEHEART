//
//  MenuInfoView.swift
//  TWOSOMEHEART-iOS
//
//  Created by 김예지 on 11/21/24.
//

import UIKit

class MenuInfoView: UIView {
    // MARK: - UI Components
    
    private let menuImageView = UIImageView()
    private let statusLabel = UILabel()
    private let menuNameLabel = UILabel()
    private let menuDescriptionLabel = UILabel()
    private let priceLabel = UILabel()
    private let cautionLabel = UILabel()
    private let cautionLabel2 = UILabel()
    private let seperateLineView = UIView()
    
    
    // MARK: - Initializer
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setStyle()
        setHierarchy()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Style, UI, Layout
    private func setStyle(){
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
        
        seperateLineView.do {
            $0.backgroundColor = UIColor(resource: .gray20)
        }
    }
    
    private func setHierarchy(){
        addSubviews(menuImageView,
                     statusLabel,
                     menuNameLabel,
                     menuDescriptionLabel,
                     priceLabel,
                     cautionLabel,
                     cautionLabel2,
                     seperateLineView
        )
    }
    
    private func setLayout(){
        menuImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
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
        
        seperateLineView.snp.makeConstraints {
            $0.top.equalTo(cautionLabel2.snp.bottom).offset(12)
            $0.horizontalEdges.bottom.equalToSuperview()
            $0.height.equalTo(4)
        }
    }
    
    // MARK: - Bind
    func bind(_ menuDetail: MenuDetail) {
        menuImageView.image = menuDetail.imageURL
        statusLabel.text = menuDetail.status
        statusLabel.backgroundColor = menuDetail.status == "New" ? UIColor(resource: .red40) : UIColor(resource: .gray20)
        menuNameLabel.text = menuDetail.name
        menuDescriptionLabel.text = menuDetail.description
        priceLabel.text = "\(menuDetail.price)원"
        
        let cautions = menuDetail.caution.split(separator: ",").map { String($0).trimmingCharacters(in: .whitespaces) }
        cautionLabel.isHidden = cautions.isEmpty
        cautionLabel.text = cautions.first
        cautionLabel2.isHidden = cautions.count <= 1
        cautionLabel2.text = cautions.count > 1 ? cautions[1] : nil
    }
}
