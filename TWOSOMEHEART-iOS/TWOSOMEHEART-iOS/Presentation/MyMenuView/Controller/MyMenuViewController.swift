//
//  MyMenuViewController.swift
//  TWOSOMEHEART-iOS
//
//  Created by 김예지 on 11/17/24.
//

import UIKit

import SnapKit
import Then

class MyMenuViewController: BaseViewController {
    // MARK: - UI Properties
    
    private let myMenuHeaderView = MyMenuHeaderView()
    
    private lazy var myMenuCollectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: UICollectionViewFlowLayout()
    )
    
    private let myMenuModalView = MyMenuModalView().then {
        $0.isHidden = true
    }
    
    // MARK: - Properties
    
    let myMenuItems = MyMenuItem.myMenuItems
    var selectedIndexes: Set<Int> = []
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setCollectionView()
        setModal()
    }
    
    override func setHierarchy() {
        super.setHierarchy()
        view.addSubviews(myMenuHeaderView,
                         myMenuCollectionView,
                         myMenuModalView)
    }
    
    override func setLayout() {
        myMenuHeaderView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.height.equalTo(82)
        }
        
        myMenuCollectionView.snp.makeConstraints {
            $0.top.equalTo(myMenuHeaderView.snp.bottom).offset(20)
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.bottom.equalToSuperview()
        }
        
        myMenuModalView.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(147)
            $0.bottom.equalToSuperview().offset(147)
        }
    }
}

// MARK: - UI Setting
private extension MyMenuViewController {
    func setCollectionView() {
        let flowLayout = UICollectionViewFlowLayout()
        let itemSize = (UIScreen.main.bounds.width - 32)
        
        flowLayout.itemSize = CGSize(width: itemSize, height: 165)
        flowLayout.minimumLineSpacing = 32
        flowLayout.scrollDirection = .vertical
        
        myMenuCollectionView.do {
            $0.setCollectionViewLayout(flowLayout, animated: true)
            $0.register(MyMenuCollectionViewCell.self, forCellWithReuseIdentifier: MyMenuCollectionViewCell.identifier)
            $0.dataSource = self
            $0.showsHorizontalScrollIndicator = false
        }
    }
    
    func setModal() {
        myMenuModalView.orderButton.addTarget(self, action: #selector(hideModal), for: .touchUpInside)
    }
    
    func showModal() {
        guard !selectedIndexes.isEmpty else { return }
        
        let totalQuantity = selectedIndexes.count
        let totalPrice = selectedIndexes.reduce(0) { result, index in
            result + myMenuItems[index].price
        }
        
        myMenuModalView.configure(price: totalPrice, quantity: totalQuantity)
        
        myMenuModalView.isHidden = false
        UIView.animate(withDuration: 0.3) {
            self.myMenuModalView.snp.updateConstraints {
                $0.bottom.equalToSuperview()
            }
            self.view.layoutIfNeeded()
        }
    }
    
    @objc private func hideModal() {
        UIView.animate(withDuration: 0.3) {
            self.myMenuModalView.snp.updateConstraints {
                $0.bottom.equalToSuperview().offset(self.myMenuModalView.frame.height + self.view.safeAreaInsets.bottom)
            }
            self.view.layoutIfNeeded()
        } completion: { _ in
            self.myMenuModalView.isHidden = true
        }
    }
}

// MARK: - CollectionView Method
extension MyMenuViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return myMenuItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let item = collectionView.dequeueReusableCell(withReuseIdentifier: MyMenuCollectionViewCell.identifier, for: indexPath) as? MyMenuCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        item.delegate = self
        item.configure(with: indexPath.row)
        item.bind(myMenuItems[indexPath.item])
        return item
    }
}

// MARK: - CollectionView Delegate
extension MyMenuViewController: MyMenuCollectionViewCellDelegate {
    func checkboxTapped(at index: Int, isSelected: Bool) {
        if isSelected {
            selectedIndexes.insert(index)
        } else {
            selectedIndexes.remove(index)
        }
        
        selectedIndexes.isEmpty ? hideModal() : showModal()
    }
}
