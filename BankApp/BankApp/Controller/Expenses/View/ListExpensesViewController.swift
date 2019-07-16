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
    
    private lazy var presenter: ExpensePresenter = {
        let presenter = ExpensePresenter(viewProtocol: self, serviceAPI: ExpenseService())
        return presenter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        presenter.fetchExpenses()
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
        tableView.register(ExpensesViewCell.self)
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.getCountExpense()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let expenseItem = presenter.getExpense(by: indexPath.row)
        switch expenseItem {
        case let .cell(expenseValue):
            let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as ExpensesViewCell
            cell.setup(expense: expenseValue)
            return cell
        case let .error(error):
            return UITableViewCell()
            
        case .loading:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = ExpenseHeaderView(frame: .zero)
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return ExpenseHeaderView.tableViewHeaderHeight
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Recentes"
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
