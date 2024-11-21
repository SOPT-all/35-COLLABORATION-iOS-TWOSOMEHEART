//
//  NutritionInfoView.swift
//  TWOSOMEHEART-iOS
//
//  Created by 김예지 on 11/21/24.
//

import UIKit

class NutritionInfoView: UIView {
    
    // MARK: - UI Components
    private let label = UILabel()

    // MARK: - Initializer
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setStyle()
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Style, UI, Layout
    
    private func setStyle(){
        label.do {
            $0.text = "하이"
        }
    }
    
    private func setUI(){
        addSubviews(label)
    }
    
    private func setLayout(){
        
    }

}
