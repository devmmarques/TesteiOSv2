//
//  TitleHeaderView.swift
//  BankApp
//
//  Created by Marco Henrique Maia Marques on 16/07/19.
//  Copyright © 2019 Marco Henrique Maia Marques. All rights reserved.
//

import UIKit

final class TitleHeaderView: UIView {
    
    static var titleViewHeaderHeight: CGFloat = 220
    
    static func size(width: CGFloat) -> CGSize {
        return CGSize(width: width, height: titleViewHeaderHeight)
    }
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.accessibilityIdentifier = "titleLabel"
        label.font = UIFont(font: FontFamily.HelveticaNormal.regular, size: 17)
        label.textColor = .black
        label.textAlignment = .left
        return label
    }()
    
    init(frame: CGRect, title: String, colorBackGround: UIColor) {
        super.init(frame: frame)
        titleLabel.text = title
        backgroundColor = colorBackGround
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TitleHeaderView: CodeViewProtocol {
    func buildViewHierarchy() {
        addSubview(titleLabel)
    }
    
    func setupConstraints() {
        titleLabel.anchor(top: topAnchor,
                          leading: leadingAnchor,
                          bottom: bottomAnchor,
                          trailing: trailingAnchor,
                          insets: .init(top: 10, left: 16, bottom: 10, right: 10))
    }
    
    
}
