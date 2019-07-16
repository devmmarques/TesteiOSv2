//
//  ExpensesViewCell.swift
//  BankApp
//
//  Created by Marco Henrique Maia Marques on 15/07/19.
//  Copyright © 2019 Marco Henrique Maia Marques. All rights reserved.
//

import UIKit

final class ExpenseHeaderView: UIView {
    
    static var tableViewHeaderHeight: CGFloat = 220
    
    static func size(width: CGFloat) -> CGSize {
        return CGSize(width: width, height: tableViewHeaderHeight)
    }
    
    private lazy var backGroundView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = ColorName.colorBackgroundHeader.color
        return view
    }()
    
    private lazy var nameAccountLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.accessibilityIdentifier = "nameAccountLabel"
        label.font = UIFont(font: FontFamily.Helvetica.light, size: 25)
        label.textColor = .white
        label.textAlignment = .right
        label.text = "José da Silva teste"
        return label
    }()
    
    private lazy var titleAccountLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.accessibilityIdentifier = "titleAccountLabel"
        label.font = UIFont(font: FontFamily.HelveticaNormal.regular, size: 12)
        label.textColor = .white
        label.textAlignment = .right
        label.text = L10n.account
        return label
    }()
    
    private lazy var numberAccountLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.accessibilityIdentifier = "numberAccountLabel"
        label.font = UIFont(font: FontFamily.Helvetica.light, size: 25)
        label.textColor = .white
        label.textAlignment = .right
        label.text = "2050 / 01.11122-4"
        return label
    }()
    
    private lazy var titleValueLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.accessibilityIdentifier = "titleValueLabel"
        label.font = UIFont(font: FontFamily.HelveticaNormal.regular, size: 12)
        label.textColor = .white
        label.textAlignment = .right
        label.text = L10n.balance
        return label
    }()
    
    private lazy var valueAccountLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.accessibilityIdentifier = "titleAccountLabel"
        label.font = UIFont(font: FontFamily.Helvetica.light, size: 25)
        label.textColor = .white
        label.textAlignment = .right
        label.text = "R$1.000,00"
        return label
    }()
    
    private lazy var iconShare: UIImageView = {
        let image = UIImageView(frame: .zero)
        image.image = Asset.iconShare.image
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
extension ExpenseHeaderView: CodeViewProtocol {
    
    func buildViewHierarchy() {
        addSubview(backGroundView)
        backGroundView.addSubview(nameAccountLabel)
        backGroundView.addSubview(titleAccountLabel)
        backGroundView.addSubview(numberAccountLabel)
        backGroundView.addSubview(titleValueLabel)
        backGroundView.addSubview(valueAccountLabel)
        backGroundView.addSubview(iconShare)
    }
    
    func setupConstraints() {
        backGroundView.anchor(top: topAnchor,
                              leading: leadingAnchor,
                              bottom: bottomAnchor,
                              trailing: trailingAnchor,
                              insets: .init(top: 0, left: 0, bottom: 0, right: 0))
        backGroundView.anchor(height: 220)
        
        nameAccountLabel.anchor(top: backGroundView.topAnchor,
                          leading: backGroundView.leadingAnchor,
                          insets: .init(top: 20, left: 20, bottom: 0, right: 0))
        
        titleAccountLabel.anchor(top: nameAccountLabel.bottomAnchor,
                                 leading: backGroundView.leadingAnchor,
                                 insets: .init(top: 30, left: 20, bottom: 0, right: 0))
        
        numberAccountLabel.anchor(top: titleAccountLabel.bottomAnchor,
                                  leading: backGroundView.leadingAnchor,
                                  insets: .init(top: 10, left: 20, bottom: 0, right: 0))
        
        titleValueLabel.anchor(top: numberAccountLabel.bottomAnchor,
                               leading: backGroundView.leadingAnchor,
                               insets: .init(top: 20, left: 20, bottom: 0, right: 0))
        
        valueAccountLabel.anchor(top: titleValueLabel.bottomAnchor,
                                 leading: backGroundView.leadingAnchor,
                                 insets: .init(top: 10, left: 20, bottom: 0, right: 0))
        
        iconShare.anchor(top: topAnchor,
                         trailing: trailingAnchor,
                         insets: .init(top: 20, left: 0, bottom: 0, right: 20))
        
        iconShare.anchor(height: 27.0, width: 27.0)
    }
    
}
