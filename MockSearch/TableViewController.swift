import UIKit

class TableViewController: UIViewController, UISearchBarDelegate {
    init() {
        super.init(nibName: nil, bundle: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        install(tableView: tableView)
        configureNavBar()
    }

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .groupTableViewBackground
        tableView.cellLayoutMarginsFollowReadableWidth = true
        tableView.dataSource = self
        return tableView
    }()

    @objc func didTouchButton() {
        let navC = UINavigationController(rootViewController: TableViewController())
        navC.navigationBar.isTranslucent = false
        navC.modalPresentationStyle = .formSheet
        navigationController?.present(navC, animated: true)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchController.searchBar.showsScopeBar.toggle()
    }


    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchController.searchBar.showsScopeBar.toggle()
    }

    func install(tableView: UITableView) {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "defaultCell")
        tableView.showsVerticalScrollIndicator = true
    }

    private lazy var searchController: UISearchController = {
        let controller = UISearchController(searchResultsController: nil)
        controller.obscuresBackgroundDuringPresentation = false
        controller.searchBar.showsScopeBar = true
        controller.searchBar.isTranslucent = false
        controller.searchBar.autocapitalizationType = .none
        controller.searchBar.returnKeyType = .search
        controller.searchBar.enablesReturnKeyAutomatically = false
        controller.searchBar.delegate = self
        controller.searchBar.scopeButtonTitles = ["Left","Right"]
        return controller
    }()

    private func configureNavBar() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Edit")
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done")
        navigationItem.title = "Issues"
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
    }
}


extension TableViewController:  UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: "defaultCell", for: indexPath)
    }
}
