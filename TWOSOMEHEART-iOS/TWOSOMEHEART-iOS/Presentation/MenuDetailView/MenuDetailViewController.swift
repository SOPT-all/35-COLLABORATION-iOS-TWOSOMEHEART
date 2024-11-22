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
    private let nutritionInfoHeaderView = NutritionInfoHeaderView()
    private let menuDetailBottomView = MenuDetailBottomView()
    

    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setDelegates()
        bindMenuInfo()
    }
    
    override func setStyle() {
        super.setStyle()
    }
    
    override func setHierarchy() {
        super.setHierarchy()
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubviews(
            menuInfoView,
            nutritionInfoHeaderView,
            menuDetailBottomView
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
        
        nutritionInfoHeaderView.snp.makeConstraints{
            $0.top.equalTo(menuInfoView.snp.bottom)
            $0.horizontalEdges.equalToSuperview()
        }
        
        menuDetailBottomView.snp.makeConstraints{
            $0.top.equalTo(nutritionInfoHeaderView.snp.bottom)
            $0.horizontalEdges.bottom.equalToSuperview()
        }
    }
    
    // MARK: - Delegates
    private func setDelegates(){
        nutritionInfoHeaderView.delegate = self
    }
}

// MARK: - Extensions
extension MenuDetailViewController {
    func bindMenuInfo() {
        if let menuItem = MenuDetail.menuItems.first {
            menuInfoView.bind(menuItem)
        }
    }
}

// MARK: - NutritionInfoHeaderViewDelegate
extension MenuDetailViewController: NutritionInfoHeaderViewDelegate {
    func headerViewTapped(_ headerView: NutritionInfoHeaderView){
        if let menuItem = MenuDetail.menuItems.first {
            headerView.nutritionInfoView.bind(menuItem)
        }
    }
}

