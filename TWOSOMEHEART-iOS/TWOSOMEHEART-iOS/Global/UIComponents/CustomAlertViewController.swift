//
//  CustomAlertViewController.swift
//  TWOSOMEHEART-iOS
//
//  Created by RAFA on 11/22/24.
//

import UIKit

final class CustomAlertViewController: BaseViewController {

    // MARK: - Properties

    private let alertView = UIView()
    private let alertLabel = UILabel()
    private let buttonTopSeparatorView = UIView()
    private let cancelButton = UIButton(type: .system)
    private let buttonCenterSeparatorView = UIView()
    private let confirmButton = UIButton(type: .system)
    private let alertButtonStackView = UIStackView()
    
    private let isAllChecked: Bool
    private let checkedMenuList: Set<Int>
    
    // MARK: - Lifecycle

    init(isAllChecked: Bool, checkedMenuList: Set<Int>) {
        self.isAllChecked = isAllChecked
        self.checkedMenuList = checkedMenuList
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setAddTargets()
    }

    // MARK: - Actions

    @objc private func cancelButtonTapped() {
        dismiss(animated: false)
    }

    @objc private func confirmButtonTapped() {
        deleteLikedMenu()
        dismiss(animated: false)
    }

    // MARK: - Helpers

    private func setAddTargets() {
        cancelButton.addTarget(
            self,
            action: #selector(cancelButtonTapped),
            for: .touchUpInside
        )

        confirmButton.addTarget(
            self,
            action: #selector(confirmButtonTapped),
            for: .touchUpInside
        )
    }

    // MARK: - UI

    override func setStyle() {
        view.backgroundColor = .tsBlack.withAlphaComponent(0.85)


        alertView.backgroundColor = .tsWhite

        alertLabel.do {
            $0.setLabel(
                text: SLAlert.title,
                numberOfLines: 1,
                textColor: .tsBlack,
                font: TSFont.b1r
            )
        }

        [buttonTopSeparatorView, buttonCenterSeparatorView].forEach {
            $0.backgroundColor = .gray20
        }

        cancelButton.do {
            $0.setTitle(SLAlert.cancel, for: .normal)
            $0.setTitleColor(.tsBlack, for: .normal)
            $0.titleLabel?.font = TSFont.b1r
        }

        confirmButton.do {
            $0.setTitle(SLAlert.confirm, for: .normal)
            $0.setTitleColor(.red40, for: .normal)
            $0.titleLabel?.font = TSFont.b1r
        }

        alertButtonStackView.do {
            $0.addArrangedSubviews([
                cancelButton,
                buttonCenterSeparatorView,
                confirmButton
            ])

            $0.setStackView(distribution: .fillProportionally)
        }
    }

    override func setHierarchy() {
        alertView.addSubviews(
            alertLabel,
            buttonTopSeparatorView,
            alertButtonStackView
        )

        view.addSubview(alertView)
    }

    override func setLayout() {
        alertView.snp.makeConstraints {
            $0.center.equalToSuperview()
        }

        alertLabel.snp.makeConstraints {
            $0.top.equalTo(alertView.snp.top).offset(34)
            $0.horizontalEdges.equalToSuperview().inset(31)
        }

        buttonTopSeparatorView.snp.makeConstraints {
            $0.top.equalTo(alertLabel.snp.bottom).offset(34)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(1)
        }

        cancelButton.snp.makeConstraints {
            $0.width.equalTo(141.5)
            $0.height.equalTo(48)
        }

        buttonCenterSeparatorView.snp.makeConstraints {
            $0.width.equalTo(1)
        }

        alertButtonStackView.snp.makeConstraints {
            $0.top.equalTo(buttonTopSeparatorView.snp.bottom)
            $0.bottom.equalTo(alertView.snp.bottom)
        }
    }
}

private extension CustomAlertViewController {

    func deleteLikedMenu() {
        let service = NetworkService<APITarget.Likes>()
        let all = isAllChecked ? "true" : "false"
        let favoriteIds = checkedMenuList.map { String($0) }.joined(separator: ",")

        let request = DTO.DeleteLikedMenuRequest(favoriteIds: favoriteIds, all: all)
        service.provider.request(.deleteLikedMenu(request)) { [weak self] response in
            switch response {
            case .success(let response):
                print("🍀🍀🍀서버 통신 성공🍀🍀🍀")
                return
            case .failure(let error):
                print(error)
            }
        }
    }
    
}
