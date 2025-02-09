//
//  ReportListViewController.swift
//  BankApp
//
//  Created by Marco Henrique Maia Marques on 15/07/19.
//  Copyright © 2019 Marco Henrique Maia Marques. All rights reserved.
//

import UIKit

final class ListExpensesViewController: UIViewController {
    
    // MARK: UI
    private lazy var backGroundView: UIView = {
        let view = UIView(frame: .zero)
        return view
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.backgroundColor = ColorName.colorBackgroundTableView.color
        tableView.separatorStyle = .none
        return tableView
    }()
    
    private let presenter: ExpensePresenter
    
    private let userAccount: UserAccount?
    
    init(userAccount: UserAccount, presenter: ExpensePresenter = ExpensePresenter()) {
        self.userAccount = userAccount
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
        tableView.register(ExpensesViewCell.self)
        tableView.register(LoadingViewCell.self)
        tableView.register(ErrorTableViewCell.self)
        presenter.viewProtocol = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        guard let user = userAccount else { return }
        presenter.fetchExpenses(idExpense: user.userId)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigation()
        setupTableView()
    }
    
    private func setupNavigation() {
        setupNavigationBar(with: .clear, prefersLargeTitles: false)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    private func setupTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.contentInsetAdjustmentBehavior = .automatic
        setStatusBarBackgroundColor(color: ColorName.colorBackgroundHeader.color)
    }
}

extension ListExpensesViewController: CodeViewProtocol {
    func buildViewHierarchy() {
        view.addSubview(backGroundView)
        backGroundView.addSubview(tableView)
    }
    
    func setupConstraints() {
        backGroundView.anchor(top: view.topAnchor,
                              leading: view.leadingAnchor,
                              bottom: view.bottomAnchor,
                              trailing: view.trailingAnchor,
                              insets: .init(top: 0, left: 0, bottom: 0, right: 0))
        
        tableView.anchor(top: backGroundView.topAnchor,
                         leading: backGroundView.leadingAnchor,
                         bottom: backGroundView.bottomAnchor,
                         trailing: backGroundView.trailingAnchor,
                         insets: .init(top: 0, left: 0, bottom: 0, right: 0))
    }
}

extension ListExpensesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

extension ListExpensesViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 1 {
          return presenter.getCountExpense()
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let expenseItem = presenter.getExpense(by: indexPath.row)
        switch expenseItem {
        case let .cell(expenseValue):
            let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as ExpensesViewCell
            cell.setup(expense: expenseValue)
            return cell
        case let .error(error):
            let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as ErrorTableViewCell
            cell.setupCell(error: error) { [weak self] in
                guard let self = self else { return }
                guard let user = self.userAccount  else { return }
                self.presenter.fetchExpenses(idExpense: user.userId)
            }
            return cell
        case .loading:
            let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as LoadingViewCell
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            let header = ExpenseHeaderView(frame: .zero, userAccount: self.userAccount)
            return header
        } else {
            let titleHeader = TitleHeaderView(frame: .zero, title: L10n.recent, colorBackGround: ColorName.colorBackgroundTableView.color)
            return titleHeader
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension ListExpensesViewController: ExpenseProtocol {
    
    func show() {
        tableView.reloadData()
    }
    
    func showLoading() {
        
    }
    
    func dismissLoading() {
        
    }
    
    func show(error: Error) {
        
    }
    
}
