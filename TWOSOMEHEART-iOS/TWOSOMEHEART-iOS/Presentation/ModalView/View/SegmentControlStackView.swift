//
//  SegmentChoiceView.swift
//  TWOSOMEHEART-iOS
//
//  Created by 이수민 on 11/22/24.
//

import UIKit

import SnapKit
import Then

class SegmentControlStackView: UIStackView {
    
    private var tempSegmentControlView: UIView
    
    private var sizeSegmentControlView: UIView
    
    private var beanSegmentControlView: UIView
    
    private var pickupSegmentControlView: UIView
    
    lazy var tempSegmentView = CustomSegmentControlView(buttons: tempButtons, segmentType: .temp)
    
    lazy var sizeSegmentView = CustomSegmentControlView(buttons: sizeButtons, segmentType: .size)
    
    lazy var beanSegmentView = CustomSegmentControlView(buttons: beanButtons, segmentType: .bean)
    
    lazy var pickupSegmentView = CustomSegmentControlView(buttons: pickupButtons, segmentType: .pickup)
    
    var tempButtons = [
        SegmentButtonFactory.makeSegmentButton(type: .temp, title: SLModal.hot),
        SegmentButtonFactory.makeSegmentButton(type: .temp, title: SLModal.cold)
    ]
    
    var sizeButtons = [
        SegmentButtonFactory.makeSegmentButton(type: .size, title: SLModal.regular, image: UIImage(resource: .modalRDiselect), selectedImage: UIImage(resource: .modalRSelect)),
        SegmentButtonFactory.makeSegmentButton(type: .size, title: SLModal.large, image: UIImage(resource: .modalLDiselect), selectedImage: .modalLSelect),
    ]
    
    var beanButtons = [
        SegmentButtonFactory.makeSegmentButton(type: .bean, title: SLModal.firstBean),
        SegmentButtonFactory.makeSegmentButton(type: .bean, title: SLModal.secondBean),
        SegmentButtonFactory.makeSegmentButton(type: .bean, title: SLModal.thirdBean)
    ]
    
    var pickupButtons = [
        SegmentButtonFactory.makeSegmentButton(type: .pickup, title: SLModal.takeHome, subTitle: SLModal.noReuseCup),
        SegmentButtonFactory.makeSegmentButton(type: .pickup, title: SLModal.drinkHere, subTitle: SLModal.reuseCup)
    ]
    
    override init(frame: CGRect) {
        tempSegmentControlView = UIView()
        sizeSegmentControlView = UIView()
        beanSegmentControlView = UIView()
        pickupSegmentControlView = UIView()
        
        super.init(frame: .zero)
        
        setStyle()
        setHierarchy()
        setLayout()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setHierarchy() {
        self.addArrangedSubviews([tempSegmentControlView,
                                  sizeSegmentControlView,
                                  beanSegmentControlView,
                                  pickupSegmentControlView])
    }
    
    func setLayout() {
        self.do {
            $0.setCustomSpacing(16, after: tempSegmentControlView)
            $0.setCustomSpacing(20, after: sizeSegmentControlView)
            $0.setCustomSpacing(20, after: beanSegmentControlView)
        }
        
        tempSegmentControlView.snp.makeConstraints {
            $0.height.equalTo(69)
        }
        sizeSegmentControlView.snp.makeConstraints {
            $0.height.equalTo(115)
        }
        beanSegmentControlView.snp.makeConstraints {
            $0.height.equalTo(71)
        }
        pickupSegmentControlView.snp.makeConstraints {
            $0.height.equalTo(91)
        }
    }
    
    func setStyle() {
        self.setStackView(axis: .vertical, distribution: .fillProportionally)
        self.backgroundColor = UIColor(resource: .tsWhite)
        self.isUserInteractionEnabled = true
        
        tempSegmentControlView = makeSegmentControlView(text: SLModal.temp, segmentType: .temp, segmentView: tempSegmentView)
        sizeSegmentControlView = makeSegmentControlView(text: SLModal.size, segmentType: .size, segmentView: sizeSegmentView)
        beanSegmentControlView = makeSegmentControlView(text: SLModal.bean, segmentType: .bean, segmentView: beanSegmentView)
        pickupSegmentControlView = makeSegmentControlView(text: SLModal.pickup, segmentType: .pickup, segmentView: pickupSegmentView)
    }
    
    private func makeSegmentControlView(text: String,
                                        segmentType: SegmentType,
                                        segmentView: CustomSegmentControlView) -> UIView {
        let view = UIView()
        let label = makeSegmentLabel(text: text)
        let infoImageView = UIImageView(image: .modalCaution)
        let segmentView = segmentView
        
        switch segmentType {
        case .temp, .size:
            infoImageView.isHidden = true
        default:
            infoImageView.isHidden = false
        }
        
        view.addSubviews(label,
                         infoImageView,
                         segmentView)
        
        label.snp.makeConstraints {
            $0.top.leading.equalToSuperview()
            $0.height.equalTo(21)
        }
        
        infoImageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalTo(label.snp.trailing)
            $0.height.width.equalTo(24)
        }
        
        segmentView.snp.makeConstraints {
            $0.top.equalTo(label.snp.bottom).offset(12)
            $0.horizontalEdges.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
          
        return view
    }
    
    func makeSegmentLabel(text: String) -> UILabel {
        let label = UILabel()
        label.do {
            $0.setLabel(text: text,
                        textColor: UIColor(resource: .tsBlack),
                        font: TSFont.b1b)
        }
        return label
    }

}
