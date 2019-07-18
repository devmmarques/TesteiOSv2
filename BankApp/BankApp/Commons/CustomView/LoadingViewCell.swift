//
//  LoadingViewCell.swift
//  BankApp
//
//  Created by Marco Henrique Maia Marques on 17/07/19.
//  Copyright © 2019 Marco Henrique Maia Marques. All rights reserved.
//

import UIKit
import Lottie

final class LoadingViewCell: UITableViewCell {
    
    private lazy var backGroundView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .clear
        view.accessibilityIdentifier = "backGroundView"
        return view
    }()

    private lazy var loadingView: AnimationView = {
        let animationView = AnimationView(name: "loading")
        animationView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        animationView.accessibilityIdentifier = "loadingView"
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        return animationView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCell() {
        self.backgroundColor = .clear
        setupViews()
        loadingView.play()
    }
}

extension LoadingViewCell: CodeViewProtocol {
    func buildViewHierarchy() {
        addSubview(backGroundView)
        backGroundView.addSubview(loadingView)
    }
    
    func setupConstraints() {
        backGroundView.anchor(top: topAnchor,
                              leading: leadingAnchor,
                              trailing: trailingAnchor,
                              insets: .init(top: 0, left: 0, bottom: 0, right: 0  ))
        backGroundView.anchor(height: 200.0)
        
        loadingView.anchorCenterSuperview()
    }
    
}
