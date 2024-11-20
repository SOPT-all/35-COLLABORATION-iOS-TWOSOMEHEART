//
//  MenuDetailViewController.swift
//  TWOSOMEHEART-iOS
//
//  Created by 김예지 on 11/21/24.
//

import UIKit

import SnapKit
import Then

class MenuDetailViewController: BaseViewController {
    // MARK: - UI Components
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    private let menuInfoView = MenuInfoView()
    lazy var orderButton = UIButton()
    
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func setStyle() {
        super.setStyle()
        
        orderButton.do {
            $0.setTitle("주문하기", for: .normal)
            $0.setTitleColor(UIColor(resource: .tsWhite), for: .normal)
            $0.titleLabel?.font = TSFont.btn1s
            $0.backgroundColor = UIColor(resource: .tsBlack)
        }
    }
    
    override func setHierarchy() {
        super.setHierarchy()
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubviews(
            menuInfoView,
            orderButton
        )
    }
    
    override func setLayout() {
        super.setLayout()
        scrollView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.horizontalEdges.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        
        contentView.snp.makeConstraints {
            $0.edges.equalTo(scrollView)
            $0.width.equalTo(scrollView.snp.width)
        }
        
        menuInfoView.snp.makeConstraints{
            $0.top.equalTo(contentView.snp.top)
            $0.horizontalEdges.equalToSuperview()
        }
        
        orderButton.snp.makeConstraints {
            $0.top.equalTo(menuInfoView.snp.bottom).offset(67)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(54)
            $0.bottom.equalToSuperview()
        }
    }
}
