import UIKit

class SearchVC: UIViewController {

    private let searchTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Search"
        textField.textAlignment = .center
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 8
        textField.layer.borderColor = UIColor.systemGray.cgColor
        textField.textColor = .label
        return textField
    }()
    
    private let searchButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Search", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        button.backgroundColor = .systemBlue
        button.tintColor = .white
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        setupUI()
    }
    
    private func setupUI() {
        view.addSubview(searchTextField)
        view.addSubview(searchButton)
        
        NSLayoutConstraint.activate([
            searchTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            searchTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            searchTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            searchTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            searchTextField.heightAnchor.constraint(equalToConstant: 40),
            
            searchButton.topAnchor.constraint(equalTo: searchTextField.bottomAnchor, constant: 20),
            searchButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            searchButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            searchButton.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        
        searchButton.addTarget(self, action: #selector(searchButtonTapped), for: .touchUpInside)
    }
    
    @objc private func searchButtonTapped() {
        guard let searchTerm = searchTextField.text, !searchTerm.isEmpty else {
            // Handle empty search term
            return
        }
        
        // Perform search with the search term
        performSearch(with: searchTerm)
    }
    
    private func performSearch(with term: String) {
        // Your search logic here
    }
    
}
