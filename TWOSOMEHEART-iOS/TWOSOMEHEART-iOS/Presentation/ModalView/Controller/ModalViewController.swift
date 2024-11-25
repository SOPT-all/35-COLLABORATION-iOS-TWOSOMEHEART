//
//  ModalViewController.swift
//  TWOSOMEHEART-iOS
//
//  Created by 이수민 on 11/19/24.
//

import UIKit

import SnapKit
import Then

class ModalViewController: BaseViewController {
    
    let modalView = ModalView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setHierarchy()
        setLayout()
        setStyle()
        setupSegments()
    }
    
    override func setHierarchy() {
        view.addSubview(modalView)
    }
    
    override func setLayout() {
        modalView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    override func setStyle() {
        modalView.personalCupButton.addTarget(self, action: #selector(personalCupButtonTapped), for: .touchUpInside)
    }
    
    @objc
    func personalCupButtonTapped() {
        modalView.personalCupButton.isSelected.toggle()
        modalView.personalCupPriceLabel.isHidden.toggle()
        modalView.personalCupExplainLabel.isHidden.toggle()
    }
    
    private var segmentStates: [Bool] = Array(repeating: false, count: 4)
    
    var isOrderable: Bool = false {
        didSet {
            updateOrderUI()
        }
    }
    
    var isLongSheet: Bool = false {
        didSet {
            updateSheetLayout()
        }
    }
    
}

// MARK :- OrderUI 활성화 로직
extension ModalViewController {
    func setupSegments() {
        let segments = [modalView.segmentControlStackView.tempSegmentView,
                        modalView.segmentControlStackView.sizeSegmentView,
                        modalView.segmentControlStackView.beanSegmentView,
                        modalView.segmentControlStackView.pickupSegmentView]
        
        segments.enumerated().forEach { index, segment in
            segment.onSelectedStateChanged = { [weak self] isSelected in
                self?.segmentStates[index] = isSelected
                self?.checkOrderable()
                self?.checkLongSheet()
            }
        }
    }

    func checkOrderable() {
        isOrderable = segmentStates.allSatisfy { $0 }
    }
    
    func checkLongSheet() {
        isLongSheet = (segmentStates.filter { $0 }.count >= 1)
    }

    func updateOrderUI() {
        modalView.shopButton.isEnabled = isOrderable
        modalView.starButton.isEnabled = isOrderable
        if isOrderable {
            modalView.shopButton.backgroundColor = UIColor(resource: .red40)
            modalView.starButton.layer.borderColor = UIColor(resource: .red40).cgColor
            modalView.orderButton.titleLabel?.textColor = UIColor(resource: .tsWhite)
            modalView.orderButton.backgroundColor = UIColor(resource: .tsBlack)
        } else {
            modalView.shopButton.backgroundColor = UIColor(resource: .red40).withAlphaComponent(0.4)
            modalView.starButton.layer.borderColor = UIColor(resource: .red40).withAlphaComponent(0.4).cgColor
            modalView.orderButton.titleLabel?.textColor = UIColor(resource: .gray50)
            modalView.orderButton.backgroundColor = UIColor(resource: .gray20)
        }
    }
    
    func updateSheetLayout() {
        isLongSheet ? setLongSheetLayout() : setSheetLayout()
        let bottomOffset = CGPoint(
           x: 0,
           y: modalView.scrollView.contentSize.height - modalView.scrollView.bounds.height
        )
        modalView.scrollView.setContentOffset(bottomOffset, animated: true)
    }
}
