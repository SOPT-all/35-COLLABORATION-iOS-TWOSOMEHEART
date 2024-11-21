//
//  MyMenuCollectionViewCell.swift
//  TWOSOMEHEART-iOS
//
//  Created by 김예지 on 11/17/24.
//

import UIKit

import SnapKit
import Then

protocol MyMenuCollectionViewCellDelegate: AnyObject {
    func checkboxTapped(at index: Int, isSelected: Bool)
}

class MyMenuCollectionViewCell: UICollectionViewCell {
    // MARK: - Properties
    
    static let identifier: String = "MyMenuTableCell"
    weak var delegate: MyMenuCollectionViewCellDelegate?
    private var index: Int = 0
    private var isSelectedCheckbox = false
    private var myMenuItems: MyMenuItem?
    
    // MARK: - Components
    private lazy var checkboxButton = UIButton(type: .custom)
    private let menuImageView = UIImageView()
    private let menuNameLabel = UILabel()
    private let menuPriceLabel = UILabel()
    private let menuOptionsLabel = UILabel()
    private let dragMenuButton = UIButton(type: .custom)
    private lazy var cartButton = UIButton()
    private lazy var orderNowButton = UIButton()
    
    // MARK: - Initializer
    override init(frame: CGRect) {
        super.init(frame: frame)
        setStyle()
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Style, UI, Layout
    private func setStyle(){
        checkboxButton.do {
            $0.setImage(UIImage(resource: .modalCheckboxDeselect), for: .normal)
            $0.setImage(UIImage(resource: .mymenuCheckboxSelect), for: .selected)
            $0.addTarget(self, action: #selector(checkboxButtonTapped), for: .touchUpInside)
        }
        
        menuImageView.do {
            $0.contentMode = .scaleAspectFill
            $0.clipsToBounds = true
        }
        
        menuNameLabel.do{
            $0.font = TSFont.b2r
            $0.textColor = UIColor(resource: .tsBlack)
        }
        
        menuPriceLabel.do {
            $0.font = TSFont.t1b
            $0.textColor = UIColor(resource: .tsBlack)
        }
        
        menuOptionsLabel.do {
            $0.font = TSFont.c2r
            $0.textColor = UIColor(resource: .gray70)
        }
        
        dragMenuButton.do {
            $0.setImage(UIImage(resource: .mymenuMove), for: .normal)
            $0.isUserInteractionEnabled = true
        }
        
        cartButton.do{
            $0.setTitle("장바구니 담기", for: .normal)
            $0.titleLabel?.font = TSFont.c2b
            $0.setTitleColor(UIColor(resource: .tsBlack), for: .normal)
            $0.layer.borderWidth = 1.0
            $0.layer.borderColor = UIColor(resource: .tsBlack).cgColor
        }
        
        orderNowButton.do{
            $0.setTitle("지금 바로 주문", for: .normal)
            $0.titleLabel?.font = TSFont.c2b
            $0.setTitleColor(UIColor(resource: .tsBlack), for: .normal)
            $0.layer.borderWidth = 1.0
            $0.layer.borderColor = UIColor(resource: .tsBlack).cgColor
        }
    }
    
    private func setUI(){
        contentView.addSubviews(checkboxButton,
                                menuImageView,
                                menuNameLabel,
                                menuPriceLabel,
                                menuOptionsLabel,
                                dragMenuButton,
                                cartButton,
                                orderNowButton)
    }
    
    private func setLayout(){
        checkboxButton.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.size.equalTo(20)
        }
        
        menuImageView.snp.makeConstraints {
            $0.top.equalTo(checkboxButton.snp.bottom).offset(8)
            $0.leading.equalToSuperview()
            $0.size.equalTo(84)
        }
        
        menuNameLabel.snp.makeConstraints {
            $0.top.equalTo(menuImageView)
            $0.leading.equalTo(menuImageView.snp.trailing).offset(15)
            $0.trailing.equalTo(dragMenuButton.snp.leading).offset(-10)
        }
        
        menuPriceLabel.snp.makeConstraints {
            $0.top.equalTo(menuNameLabel.snp.bottom)
            $0.leading.equalTo(menuNameLabel)
        }
        
        menuOptionsLabel.snp.makeConstraints {
            $0.top.equalTo(menuPriceLabel.snp.bottom).offset(5)
            $0.leading.equalTo(menuNameLabel)
        }
        
        dragMenuButton.snp.makeConstraints {
            $0.trailing.equalToSuperview()
            $0.centerY.equalTo(menuImageView.snp.centerY)
            $0.size.equalTo(48)
        }
        
        cartButton.snp.makeConstraints {
            $0.top.equalTo(menuImageView.snp.bottom).offset(15)
            $0.leading.equalTo(menuImageView.snp.leading)
            $0.width.equalTo(136)
            $0.height.equalTo(38)
        }
        
        orderNowButton.snp.makeConstraints {
            $0.top.equalTo(cartButton.snp.top)
            $0.leading.equalTo(cartButton.snp.trailing).offset(3)
            $0.width.equalTo(136)
            $0.height.equalTo(38)
            $0.bottom.equalToSuperview()
        }
    }
    
    // MARK: - Bind
    func bind(_ myMenuItem: MyMenuItem){
        menuImageView.image = myMenuItem.menuImage
        menuNameLabel.text = myMenuItem.name
        menuPriceLabel.text = "\(myMenuItem.price.formattedPrice())원"
        menuOptionsLabel.text = myMenuItem.options.joined(separator: "/")
    }
    
    func configure(with index: Int) {
        self.index = index
    }
    
    // MARK: - Button Action 
    @objc private func checkboxButtonTapped() {
        checkboxButton.isSelected.toggle()
        isSelectedCheckbox.toggle()
        checkboxButton.isSelected = isSelectedCheckbox
        delegate?.checkboxTapped(at: index, isSelected: isSelectedCheckbox)
    }
}
