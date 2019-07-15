//
//  ReportHeaderView.swift
//  BankApp
//
//  Created by Marco Henrique Maia Marques on 15/07/19.
//  Copyright © 2019 Marco Henrique Maia Marques. All rights reserved.
//

import UIKit

final class ReportHeaderView: UIView {
    
    private lazy var backGroundView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = ColorName.colorBackgroundHeader.color
        return view
    }()
    
    private lazy var fullNameUserLabel: UILabel = {
        let label = UILabel()
        label.accessibilityIdentifier = "fullNameUserLabel"
        label.textAlignment = .right
        label.textColor = .white
        label.text = "José da Silva TESTE"
        return label
    }()
    
    private lazy var titleAccountLabel: UILabel = {
        let label = UILabel()
        label.accessibilityIdentifier = "titleAccountLabel"
        label.textAlignment = .right
        label.textColor = .white
        label.text = L10n.account
        return label
    }()
    
    private lazy var numberAccountLabel: UILabel = {
        let label = UILabel()
        label.accessibilityIdentifier = "valueAccountLabel"
        label.textAlignment = .right
        label.textColor = .white
        label.text = "2050 / 003910-2"
        return label
    }()
    
    private lazy var titleBalanceLabel: UILabel = {
        let label = UILabel()
        label.accessibilityIdentifier = "titleBalanceLabel"
        label.textAlignment = .right
        label.textColor = .white
        label.text = L10n.balance
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
    }
}

extension ReportHeaderView: CodeViewProtocol {
    func buildViewHierarchy() {
        addSubview(backGroundView)
        
    }
    
    func setupConstraints() {
        backGroundView.anchor(top: topAnchor,
                              leading: leadingAnchor,
                              trailing: trailingAnchor,
                              insets: .init(top: 0, left: 0, bottom: 0, right: 0))
 
    }
}
