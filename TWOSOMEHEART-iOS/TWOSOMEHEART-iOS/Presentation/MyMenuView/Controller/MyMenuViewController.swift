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
    
    private lazy var myMenuCollectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: UICollectionViewFlowLayout()
    )
    
    // MARK: - Properties
    private let myMenuItems = MyMenuItem.myMenuItems
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setCollectionView()
    }
    
    override func setHierarchy() {
        super.setHierarchy()
        view.addSubview(myMenuCollectionView)
    }
    
    override func setLayout() {
        myMenuCollectionView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(16)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
}

// MARK: - CollectionView Setting
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
        
        item.bind(myMenuItems[indexPath.item])
        return item
    }
}
