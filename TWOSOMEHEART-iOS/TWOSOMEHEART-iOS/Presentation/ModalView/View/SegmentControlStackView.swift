//
//  SegmentChoiceView.swift
//  TWOSOMEHEART-iOS
//
//  Created by 이수민 on 11/22/24.
//

import UIKit

import SnapKit
import Then

class SegmentControlStackView : UIStackView {
    
    private var tempSegmentControlView: UIView
    
    private var sizeSegmentControlView: UIView
    
    private var beanSegmentControlView: UIView
    
    private var pickupSegmentControlView: UIView
    
    var tempButtons = [
        SegmentButtonFactory.makeSegmentButton(type: .temp, title: "핫"),
        SegmentButtonFactory.makeSegmentButton(type: .temp, title: "콜드")
    ]
    
    var sizeButtons = [
        SegmentButtonFactory.makeSegmentButton(type: .size, title: "레귤러 (325ml)", image: UIImage(resource: .modalRDiselect), selectedImage: UIImage(resource: .modalRSelect)),
        SegmentButtonFactory.makeSegmentButton(type: .size, title: "라지 (452ml)", image: UIImage(resource: .modalLDiselect), selectedImage: .modalLSelect),
    ]
    
    var beanButtons = [
        SegmentButtonFactory.makeSegmentButton(type: .bean, title: "블랙그라운드"),
        SegmentButtonFactory.makeSegmentButton(type: .bean, title: "아로마노트"),
        SegmentButtonFactory.makeSegmentButton(type: .bean, title: "SWP디카페인")
    ]
    
    var pickupButtons = [
        SegmentButtonFactory.makeSegmentButton(type: .pickup, title: "포장", subTitle: "일회용컵"),
        SegmentButtonFactory.makeSegmentButton(type: .pickup, title: "매장", subTitle: "머그컵")
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
        
        tempSegmentControlView = makeSegmentControlView(text: "온도", buttons: tempButtons, segmentType: .temp)
        sizeSegmentControlView = makeSegmentControlView(text: "사이즈", buttons: sizeButtons, segmentType: .size)
        beanSegmentControlView = makeSegmentControlView(text: "원두", buttons: beanButtons, segmentType: .bean)
        pickupSegmentControlView = makeSegmentControlView(text: "픽업방식", buttons: pickupButtons, segmentType: .pickup)
    }
    
    private func makeSegmentControlView(text: String, buttons: [UIButton], segmentType: SegmentType) -> UIView {
        let view = UIView()
        let label = makeSegmentLabel(text: text)
        let infoImageView = UIImageView(image: .modalCaution)
        var segmentView = CustomSegmentControlView(buttons: buttons,
                                                   segmentType: segmentType)
        
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

