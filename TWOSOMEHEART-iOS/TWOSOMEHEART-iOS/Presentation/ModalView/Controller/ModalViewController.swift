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
        bindData()
        updatePrice()
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
        modalView.personalOptionButton.addTarget(self, action: #selector(personalOptionButtonTapped), for: .touchUpInside)
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
    
    var price: Int = ModalInfo.modalInfo.price
    
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
    
    func bindData() {
        modalView.priceLabel.text = "\(price)원"
        modalView.personalOptionListLabel.text = ModalInfo.modalInfo.personalOption
    }
    
}

// MARK :- 가격 변경 로직
private extension ModalViewController {
    
    func updatePrice() {
        modalView.counterView.onValueChanged = { [weak self] count in
            guard let self = self else { return }
            
            price = (ModalInfo.modalInfo.price)*count
            let price =  price - (modalView.personalCupButton.isSelected ? 300 : 0)
            modalView.priceLabel.text = "\(price)원"
        }
    }
    
}

// MARK :- 체크박스 선택 로직
private extension ModalViewController {
    
    @objc
    func personalCupButtonTapped() {
        modalView.personalCupButton.isSelected.toggle()
        modalView.personalCupPriceLabel.isHidden.toggle()
        modalView.personalCupExplainLabel.isHidden.toggle()
        modalView.contentView.snp.remakeConstraints {
            $0.verticalEdges.equalTo(modalView.scrollView.contentLayoutGuide)
            $0.width.equalTo(modalView.scrollView.frameLayoutGuide)
            $0.height.equalTo(modalView.personalCupButton.isSelected ? 572 : 552)
        }
        
        UIView.animate(withDuration: 0.3) { [weak self] in
            self?.modalView.layoutIfNeeded()
            self?.scrollToBottom()
        }
        
        let price = price - (modalView.personalCupButton.isSelected ? 300 : 0)
        modalView.priceLabel.text = "\(price)원"
    }
    
}

// MARK :- OrderUI 활성화 로직
private extension ModalViewController {
    
    func checkOrderable() {
        isOrderable = segmentStates.allSatisfy { $0 }
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
}

// MARK :- 하나 이상의 옵션 선택 시 Sheet Layout 변경 로직
private extension ModalViewController {
    
    func checkLongSheet() {
        isLongSheet = (segmentStates.filter { $0 }.count >= 1)
    }
    
    func updateSheetLayout() {
        isLongSheet ? setLongSheetLayout() : setSheetLayout()
        scrollToBottom()
    }
    
    func scrollToBottom() {
        let bottomOffset = CGPoint(
           x: 0,
           y: modalView.scrollView.contentSize.height - modalView.scrollView.bounds.height
        )
        modalView.scrollView.setContentOffset(bottomOffset, animated: true)
    }
}

// MARK: - MenuOptionVC로 이동
private extension ModalViewController {
    
    @objc
    func personalOptionButtonTapped() {
        let menuOptionVC = MenuOptionViewController()
        menuOptionVC.modalPresentationStyle = .fullScreen
        present(menuOptionVC, animated: true)
    }
    
}
