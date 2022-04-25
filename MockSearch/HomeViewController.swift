import UIKit

class ViewController: UIViewController {
    lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle("Toggle", for: .normal)
        return button
    }()

    init(){
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate( [
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        button.addTarget(self, action: #selector(didTouchButton), for: .touchUpInside)
    }

    @objc func didTouchButton() {
        presentTableView()
    }

    private func presentTableView(){
        let navC = UINavigationController(rootViewController: TableViewController())
        navC.navigationBar.isTranslucent = true
        navC.modalPresentationStyle = .formSheet
        navigationController?.present(navC, animated: true)
    }
}
