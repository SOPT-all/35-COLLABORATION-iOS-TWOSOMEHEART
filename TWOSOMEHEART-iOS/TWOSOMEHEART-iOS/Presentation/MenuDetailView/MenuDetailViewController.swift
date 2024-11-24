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
    
    private let tableView = UITableView()
    private let menuDetailBottomView = MenuDetailBottomView()
    
    // MARK: - Properties
    private let menuItem = MenuDetail.menuItems.first
    private var isExpanded: Bool = false
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setDelegates()
        registerCells()
    }
    
    override func setStyle() {
        tableView.do {
            $0.separatorStyle = .none
            $0.rowHeight = UITableView.automaticDimension
            $0.estimatedRowHeight = 760
        }
    }
    
    override func setHierarchy() {
        view.addSubviews(tableView, menuDetailBottomView)
    }
    
    override func setLayout() {
        tableView.snp.makeConstraints{
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.horizontalEdges.equalToSuperview()
        }
        
        menuDetailBottomView.snp.makeConstraints{
            $0.top.equalTo(tableView.snp.bottom)
            $0.horizontalEdges.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
    
    // MARK: - Delegates
    private func setDelegates(){
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func registerCells(){
        tableView.register(
            MenuInfoTableViewCell.self,
            forCellReuseIdentifier: MenuInfoTableViewCell.identifier
        )
        
        tableView.register(
            NutritionHeaderTableViewCell.self,
            forCellReuseIdentifier: NutritionHeaderTableViewCell.identifier
        )
        
        tableView.register(
            NutritionInfoTableViewCell.self,
            forCellReuseIdentifier: NutritionInfoTableViewCell.identifier
        )
        
        tableView.register(
            AllergyTableViewCell.self,
            forCellReuseIdentifier: AllergyTableViewCell.identifier
        )
    }
}

// MARK: - TableViewCellDelegate
extension MenuDetailViewController: NutritionHeaderTableViewCellDelegate {
    func headerViewTapped() {
        isExpanded.toggle()
        tableView.reloadData()    }
}

// MARK: - UITableViewDataSource
extension MenuDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isExpanded ? 4 : 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            guard let menuInfoCell = tableView.dequeueReusableCell(
                withIdentifier: MenuInfoTableViewCell.identifier,
                for: indexPath
            ) as? MenuInfoTableViewCell else { return UITableViewCell() }
            
            if let menuItem = menuItem {
                menuInfoCell.bind(menuItem)
            }
            menuInfoCell.selectionStyle = .none
            
            return menuInfoCell
            
        case 1:
            guard let headerCell = tableView.dequeueReusableCell(
                withIdentifier: NutritionHeaderTableViewCell.identifier,
                for: indexPath
            ) as? NutritionHeaderTableViewCell else { return UITableViewCell() }
            
            headerCell.delegate = self
            headerCell.isExpanded = isExpanded
            headerCell.configureGesture(delegate: self)
            
            headerCell.selectionStyle = .none
            return headerCell
            
        case 2:
            if isExpanded {
                guard let nutritionInfoCell = tableView.dequeueReusableCell(
                    withIdentifier: NutritionInfoTableViewCell.identifier,
                    for: indexPath
                ) as? NutritionInfoTableViewCell else { return UITableViewCell() }
                
                if let menuItem = menuItem {
                    nutritionInfoCell.bind(menuItem)
                }
                
                nutritionInfoCell.selectionStyle = .none
                return nutritionInfoCell
            } else {
                guard let allergyInfoCell = tableView.dequeueReusableCell(
                    withIdentifier: AllergyTableViewCell.identifier,
                    for: indexPath
                ) as? AllergyTableViewCell else { return UITableViewCell() }
                
                if let allergy = menuItem?.allergy {
                    allergyInfoCell.bind(allergy: allergy)
                }
                
                allergyInfoCell.selectionStyle = .none
                return allergyInfoCell
            }
            
        case 3:
            guard let allergyInfoCell = tableView.dequeueReusableCell(
                withIdentifier: AllergyTableViewCell.identifier,
                for: indexPath
            ) as? AllergyTableViewCell else { return UITableViewCell() }
            allergyInfoCell.selectionStyle = .none
            
            if let allergy = menuItem?.allergy {
                allergyInfoCell.bind(allergy: allergy)
            }
            
            return allergyInfoCell
            
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension MenuDetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 1:
            return 68
        default:
            return UITableView.automaticDimension
        }
    }
}
