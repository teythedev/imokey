//
//  HomePageViewController.swift
//  imokey
//
//  Created by Tugay on 27.12.2022.
//

import UIKit

class HomePageViewController: UIViewController {

    var viewModel: HomePageViewModelProtocol! {
        didSet {
            viewModel.delegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension HomePageViewController: HomePageViewModelDelegate {
    
}
