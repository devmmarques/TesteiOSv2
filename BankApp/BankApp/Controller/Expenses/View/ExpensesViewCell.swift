//
//  ReportHeaderView.swift
//  BankApp
//
//  Created by Marco Henrique Maia Marques on 15/07/19.
//  Copyright © 2019 Marco Henrique Maia Marques. All rights reserved.
//

import UIKit

class ExpensesViewCell: UITableViewCell {
   
    // MARK: Outlets
    private lazy var viewExpense: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .white
        view.accessibilityIdentifier = "viewExpense"
        view.layer.borderColor = ColorName.colorBorderCell.color.cgColor
        view.layer.borderWidth = 0.3
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.accessibilityIdentifier = "titleLabel"
        label.textColor = ColorName.colorGrayLight.color
        label.textAlignment = .right
        return label
    }()
    
    private lazy var descLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.accessibilityIdentifier = "descLabel"
        label.font = UIFont(font: FontFamily.HelveticaNormal.regular, size: 16)
        label.textColor = ColorName.colorGrayStrong.color
        label.textAlignment = .right
        return label
    }()
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.accessibilityIdentifier = "dateLabel"
        label.font = UIFont(font: FontFamily.HelveticaNormal.regular, size: 12)
        label.textColor = ColorName.colorGrayLight.color
        label.textAlignment = .left
        return label
    }()
    
    private lazy var valueLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.accessibilityIdentifier = "valueLabel"
        label.font = UIFont(font: FontFamily.HelveticaNormal.regular, size: 20)
        label.textColor = ColorName.colorGrayStrong.color
        label.textAlignment = .left
        return label
    }()
    
    
    func setup(expense: Expense) {
        titleLabel.text = expense.title
        descLabel.text = expense.desc
        dateLabel.text = expense.date.toDateFormatted(with: "dd/MM/yyyy")
        valueLabel.text = "R$" + String(format:"%f", expense.value)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func setupCell() {
        self.selectionStyle = .none
        self.backgroundColor = .clear
        setupViews()
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        configureLayoutContact()
    }
    
    private func configureLayoutContact() {
        viewExpense.layer.cornerRadius = 10
        viewExpense.layer.masksToBounds = true
        viewExpense.applyCellShadow(color: ColorName.colorBorderCell.color, radius: 10, opacity: 0.3)
    }
}

extension ExpensesViewCell: CodeViewProtocol {
    
    func buildViewHierarchy() {
        addSubview(viewExpense)
        viewExpense.addSubview(titleLabel)
        viewExpense.addSubview(descLabel)
        viewExpense.addSubview(dateLabel)
        viewExpense.addSubview(valueLabel)
    }
    
    func setupConstraints() {
        viewExpense.anchor(top: topAnchor,
                           leading: leadingAnchor,
                           bottom: bottomAnchor,
                           trailing: trailingAnchor,
                           insets: .init(top: 10, left: 16, bottom: 10, right: 16))
        viewExpense.anchor(height: 80.0)
        
        titleLabel.anchor(top: viewExpense.topAnchor,
                          leading: viewExpense.leadingAnchor,
                          insets: .init(top: 10, left: 10, bottom: 0, right: 0))
        
        descLabel.anchor(leading: viewExpense.leadingAnchor,
                         bottom: viewExpense.bottomAnchor,
                         insets: .init(top: 0, left: 10, bottom: 10, right: 0))
        
        dateLabel.anchor(top: viewExpense.topAnchor,
                         trailing: viewExpense.trailingAnchor,
                         insets: .init(top: 10, left: 0, bottom: 0, right: 10))
        
        valueLabel.anchor(bottom: viewExpense.bottomAnchor,
                          trailing: viewExpense.trailingAnchor,
                          insets: .init(top: 0, left: 0, bottom: 10, right: 10))
    }
}
