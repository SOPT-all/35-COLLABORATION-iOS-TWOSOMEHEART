//
//  AlergyTableViewCell.swift
//  TWOSOMEHEART-iOS
//
//  Created by 김예지 on 11/22/24.
//

import UIKit

class AllergyTableViewCell: BaseTableViewCell {
    // MARK: - UI Components
    private let allergyTitleLabel = UILabel()
    private let allergyLabel = UILabel()
    
    // MARK: - Initializer
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setStyle() {
        allergyTitleLabel.do {
            $0.setLabel(
                text: SLMenuDetail.allergy,
                textColor: .tsBlack,
                font: TSFont.t1b
            )
        }
        
        allergyLabel.do {
            $0.setLabel(
                textColor: .tsBlack,
                font: TSFont.b2r
            )
        }
    }
    
    override func setHierarchy(){
        contentView.addSubviews(allergyTitleLabel, allergyLabel)
    }
    
    override func setLayout(){
        allergyTitleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(30)
            $0.leading.equalToSuperview().offset(16)
        }
        
        allergyLabel.snp.makeConstraints {
            $0.top.equalTo(allergyTitleLabel.snp.bottom).offset(13)
            $0.leading.equalToSuperview().offset(16)
            $0.bottom.equalToSuperview()
        }
    }
    
    // MARK: - Bind
    func bind(allergy: String?) {
        allergyLabel.text = allergy ?? ""
    }
}
