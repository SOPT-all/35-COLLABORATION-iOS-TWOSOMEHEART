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
    private let nutrionInfoLabel = UILabel()
    lazy var detailArrowImageView = UIImageView()
    private let seperateLineView = UIView()
    
    // MARK: - Properties
    
    var isExpanded: Bool = false
    
    // MARK: - Initializer
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Style, UI, Layout
    
    override func setStyle(){
        nutrionInfoLabel.do {
            $0.setLabel(
                text: "제품 영양 정보",
                alignment: .left,
                textColor: .tsBlack,
                font: TSFont.t1b
            )
        }
        
        detailArrowImageView.do {
            $0.image = UIImage(resource: .detailArrowDown)
            $0.isUserInteractionEnabled = true
        }
        
        seperateLineView.do {
            $0.backgroundColor = UIColor(resource: .gray10)
        }
    }
    
    override func setHierarchy() {
        contentView.addSubviews(nutrionInfoLabel, detailArrowImageView, seperateLineView)
    }
    
    override func setLayout() {
        nutrionInfoLabel.snp.makeConstraints {
            $0.top.trailing.equalToSuperview()
            $0.leading.equalToSuperview().inset(16)
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(16)
        }
        
        detailArrowImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(16)
        }
        
        seperateLineView.snp.makeConstraints{
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
        
        let imageFile = isExpanded ? UIImage(resource: .detailArrowDown): UIImage(resource: .detailArrowUp)
        detailArrowImageView.image = imageFile
        seperateLineView.isHidden = !isExpanded
    }
}
