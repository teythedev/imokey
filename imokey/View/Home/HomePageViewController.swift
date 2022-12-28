//
//  HomePageViewController.swift
//  imokey
//
//  Created by Tugay on 27.12.2022.
//

import UIKit
import FirebaseAuth
class HomePageViewController: UIViewController {

    var signOutButton: UIButton!
    
    var viewModel: HomePageViewModelProtocol! {
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
        signOutButton.addTarget(self, action: #selector(signOutTapped), for: .touchUpInside)
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

extension HomePageViewController: HomePageViewModelDelegate {
    
}
