//
//  HomePageViewController.swift
//  imokey
//
//  Created by Tugay on 27.12.2022.
//

import UIKit
import FirebaseAuth
final class HomeViewController: UIViewController {

    var signOutButton: UIButton!
    
    var viewModel: HomeViewModelProtocol! {
        didSet {
            viewModel.delegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func loadView() {
        view = UIView()
        view.backgroundColor = UIColor.bgColor
        
        signOutButton = UIButton()
        view.addSubview(signOutButton)
        signOutButton.translatesAutoresizingMaskIntoConstraints = false
        signOutButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        signOutButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        signOutButton.setTitle("Sign Out", for: .normal)
        signOutButton.setTitleColor(UIColor.textColor, for: .normal)
        signOutButton.addTarget(self, action: #selector(signOutTapped), for: .touchUpInside)
        
        addRightBarButton()
        
    }
    
    
    
    @objc func signOutTapped(sender: UIButton) {
        let fireAuth = Auth.auth()
        do {
            try fireAuth.signOut()
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
    }
}

extension HomeViewController: HomeViewModelDelegate {
    func navigateTo(to route: HomeViewRoute) {
        switch route {
        case .addNewMemory(let newMemoryViewModel):
            navigationController?.pushViewController( NewMemoryBuilder.make(with: newMemoryViewModel), animated: true)
        }
        
    }
    
    
}

extension HomeViewController {
    private func addRightBarButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "mappin.circle"), style: .done, target: self, action: #selector(rightBarButtonTapped))
    }
    
    @objc func rightBarButtonTapped(_ sender: UIBarButtonItem) {
        print("memory added")
    }
}
