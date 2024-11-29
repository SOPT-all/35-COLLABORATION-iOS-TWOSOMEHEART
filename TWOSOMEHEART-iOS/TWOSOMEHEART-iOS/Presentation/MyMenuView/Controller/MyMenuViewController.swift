//
//  MyMenuViewController.swift
//  TWOSOMEHEART-iOS
//
//  Created by 김예지 on 11/17/24.
//

import UIKit

import SnapKit
import Then

class MyMenuViewController: BaseNavViewController {
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
    
    private var likedItems: [DTO.GetLikedMenuResponse.FavoriteList] = [] {
        didSet {
            myMenuHeaderView.likedItemsCount = likedItems.count
        }
    }
    
    private var service: NetworkService<APITarget.Likes>?
    var selectedIndexes: Set<Int> = []
    var selectedIds: Set<Int> = []
    var allCheckBoxSelected: Bool = false
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setAddTargets()
        setDelegates()
        setCollectionView()
        setModal()
        setNavigationBarStyle()
        fetchLikedMenuList()
    }
    
    // MARK: - Actions
    
    @objc private func deleteButtonTapped() {
        let alertVC = CustomAlertViewController(isAllChecked: allCheckBoxSelected,
                                                checkedMenuList: selectedIds)
        alertVC.modalPresentationStyle = .custom
        present(alertVC, animated: false)
    }
    
    // MARK: - Helpers
    
    private func setAddTargets() {
        myMenuHeaderView.deleteButton.addTarget(
            self,
            action: #selector(deleteButtonTapped),
            for: .touchUpInside
        )
    }
    
    private func setDelegates(){
        myMenuHeaderView.delegate = self
    }
    
    // MARK: - UI
    override func setStyle() {
        super.setStyle()
        
        view.backgroundColor = .tsWhite
        myMenuCollectionView.showsVerticalScrollIndicator = false
    }
    
    override func setHierarchy() {
        super.setHierarchy()
        
        contentView.addSubviews(myMenuHeaderView,
                                myMenuCollectionView,
                                myMenuModalView)
    }
    
    override func setLayout() {
        super.setLayout()
        
        myMenuHeaderView.snp.makeConstraints {
            $0.top.equalToSuperview()
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
    
    // MARK: - Navigation Style
    private func setNavigationBarStyle() {
        setBackgroundColor(color: .tsWhite)
        setBackButton()
        setHomeButton()
        setTitleLabelStyle(title: SLNavBar.myMenu, alignment: .center)
        setBagButton()
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
            $0.dragDelegate = self
            $0.dropDelegate = self
            $0.dragInteractionEnabled = true
        }
    }
    
    func setModal() {
        myMenuModalView.orderButton.addTarget(self, action: #selector(hideModal), for: .touchUpInside)
    }
    
    func showModal() {
        guard !selectedIndexes.isEmpty else { return }
        
        let totalQuantity = selectedIndexes.count
        let totalPrice = selectedIndexes.reduce(0) { result, index in
            result + likedItems[index].price
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

// MARK: - CollectionView DataSource

extension MyMenuViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return likedItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let item = collectionView.dequeueReusableCell(withReuseIdentifier: MyMenuCollectionViewCell.identifier, for: indexPath) as? MyMenuCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        item.delegate = self
        item.configure(with: indexPath.row)
        item.bind(likedItems[indexPath.item])
        return item
    }
    
}

// MARK: - CollectionView Delegate

extension MyMenuViewController: MyMenuCollectionViewCellDelegate {
    func checkboxTapped(at index: Int, isSelected: Bool) {
        if isSelected {
            selectedIndexes.insert(index)
            selectedIds.insert(likedItems[index].id)
        } else {
            selectedIndexes.remove(index)
            selectedIds.remove(likedItems[index].id)
        }
        
        selectedIndexes.isEmpty ? hideModal() : showModal()
    }
}

//MARK: - Drag Delegate

extension MyMenuViewController: UICollectionViewDragDelegate {
    func collectionView(_ collectionView: UICollectionView, itemsForBeginning session: any UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
        print("dragging")
        let location = session.location(in: collectionView)
        
        guard let cell = collectionView.cellForItem(at: indexPath) as? MyMenuCollectionViewCell else { return [] }
        let dragHandleFrame = cell.dragMenuButton.convert(cell.dragMenuButton.bounds, to: collectionView)
        guard dragHandleFrame.contains(location) else { return [] }
        
        return [UIDragItem(itemProvider: NSItemProvider())]
    }
}

//MARK: - Drop Delegate
extension MyMenuViewController: UICollectionViewDropDelegate {
    
    // 드래그 중일 때만 드랍
    func collectionView(_ collectionView: UICollectionView, dropSessionDidUpdate session: any UIDropSession, withDestinationIndexPath destinationIndexPath: IndexPath?) -> UICollectionViewDropProposal {
        guard collectionView.hasActiveDrag else {
            return UICollectionViewDropProposal(operation: .forbidden)
        }
        return UICollectionViewDropProposal(operation: .move, intent: .insertAtDestinationIndexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, performDropWith coordinator: any UICollectionViewDropCoordinator) {
        guard let destinationIndexPath = coordinator.destinationIndexPath,
              coordinator.proposal.operation == .move
        else { return }
        
        move(coordinator: coordinator,
             destinationIndexPath: destinationIndexPath,
             collectionView: collectionView)
    }
    
    private func move(coordinator: UICollectionViewDropCoordinator, destinationIndexPath: IndexPath, collectionView: UICollectionView) {
        guard
            let sourceItem = coordinator.items.first,
            let sourceIndexPath = sourceItem.sourceIndexPath
        else { return }
        
        collectionView.performBatchUpdates { [weak self] in
            self?.moveData(sourceIndexPath: sourceIndexPath, destinationIndexPath: destinationIndexPath)
        } completion: { finish in
            print("finish:", finish)
            coordinator.drop(sourceItem.dragItem, toItemAt: destinationIndexPath)
        }
    }
    
    private func moveData(sourceIndexPath: IndexPath, destinationIndexPath: IndexPath) {
        let sourceItem = likedItems[sourceIndexPath.item]
        
        DispatchQueue.main.async {
            self.likedItems.remove(at: sourceIndexPath.item)
            self.likedItems.insert(sourceItem, at: destinationIndexPath.item)
            let indexPaths = self.likedItems
                .enumerated()
                .map(\.offset)
                .map { IndexPath(row: $0, section: 0) }
            UIView.animate(withDuration: 0) {
                self.myMenuCollectionView.reloadItems(at: indexPaths)
            }
        }
    }
    
    
}

// MARK: - MyMenuHeaderView Delegate
extension MyMenuViewController: MyMenuHeaderViewDelegate {
    func selectAllCheckboxTapped(isSelected: Bool) {
        if isSelected {
            selectedIndexes = Set(0..<likedItems.count)
            allCheckBoxSelected = true
            for i in selectedIndexes {
                selectedIds.insert(likedItems[i].id)
            }
        } else {
            selectedIndexes.removeAll()
            allCheckBoxSelected = false
            selectedIds.removeAll()
        }
        
        for index in 0..<likedItems.count {
            if let cell = myMenuCollectionView.cellForItem(at: IndexPath(row: index, section: 0)) as? MyMenuCollectionViewCell {
                print(cell, index)
                cell.setCheckboxSelected(isSelected)
            }
        }
        
        selectedIndexes.isEmpty ? hideModal() : showModal()
    }
}


// MARK: - Network
private extension MyMenuViewController {
    func fetchLikedMenuList() {
        service = NetworkService<APITarget.Likes>()
        service?.request(type: DTO.GetLikedMenuResponse.self, target: .getLikedMenu) { [weak self] response in
            guard let self = self else { return }
            
            switch response {
            case .success(let data):
                print("🍀🍀🍀서버 통신 성공")
                
                if let favoriteList = data.data?.favoriteList {
                    self.likedItems = favoriteList
                }
                
                DispatchQueue.main.async {
                    self.myMenuCollectionView.reloadData()
                }
            case .requestErr:
                print("요청 에러")
            case .decodedErr:
                print("디코딩 에러")
            case .pathErr:
                print("경로 에러")
            case .serverErr:
                print("서버 에러")
            case .networkFail:
                print("네트워크 에러")
            }
        }
    }
}

