//
//  NuturitionHeaderTableViewCell.swift
//  TWOSOMEHEART-iOS
//
//  Created by 김예지 on 11/22/24.
//

import UIKit

protocol NutritionHeaderTableViewCellDelegate : AnyObject {
    func headerViewTapped()
}

class NutritionHeaderTableViewCell: BaseTableViewCell {
    // MARK: - Delegate
    weak var delegate: NutritionHeaderTableViewCellDelegate?
    
    // MARK: - UI Components
    private let nutritionInfoLabel = UILabel()
    lazy var detailArrowImageView = UIImageView()
    private let seperatorLineView = UIView()
    
    // MARK: - Properties
    
    var isExpanded: Bool = false
    
    // MARK: - Style, UI, Layout
    
    override func setStyle(){
        nutritionInfoLabel.do {
            $0.setLabel(
                text: SLMenuDetail.nutrionInfo,
                alignment: .left,
                textColor: .tsBlack,
                font: TSFont.t1b
            )
        }
        
        detailArrowImageView.do {
            $0.image = UIImage(resource: .detailArrowDown)
            $0.isUserInteractionEnabled = true
        }
        
        seperatorLineView.do {
            $0.backgroundColor = UIColor(resource: .gray10)
        }
    }
    
    override func setHierarchy() {
        contentView.addSubviews(
            nutritionInfoLabel,
            detailArrowImageView,
            seperatorLineView
        )
    }
    
    override func setLayout() {
        nutritionInfoLabel.snp.makeConstraints {
            $0.top.trailing.equalToSuperview()
            $0.leading.equalToSuperview().inset(16)
            $0.centerY.equalToSuperview()
        }
        
        detailArrowImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(16)
        }
        
        seperatorLineView.snp.makeConstraints{
            $0.height.equalTo(1)
            $0.horizontalEdges.bottom.equalToSuperview()
        }
    }
    
    // MARK: - Actions
    func configureGesture(delegate: NutritionHeaderTableViewCellDelegate?) {
        let tapGesture = UITapGestureRecognizer(
            target: self,
            action: #selector(headerViewTapped)
        )
        
        contentView.addGestureRecognizer(tapGesture)
        self.delegate = delegate
        
    }
    
    @objc private func headerViewTapped() {
        delegate?.headerViewTapped()
        
        let imageFile = isExpanded ? UIImage(resource: .detailArrowUp): UIImage(resource: .detailArrowDown)
        detailArrowImageView.image = imageFile
        seperatorLineView.isHidden = isExpanded
    }
}
