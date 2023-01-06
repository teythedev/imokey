//
//  NewMemoryViewController.swift
//  imokey
//
//  Created by Tugay on 6.01.2023.
//

import UIKit

class NewMemoryViewController: UIViewController {
    
    weak var memoryTextView: UITextView!
    
    weak var memoryRecordAudioButton: UIButton!
    
    weak var memoryImageAddButton: UIButton!
    
    var viewModel: NewMemoryViewModelProtocol! {
        didSet {
            viewModel.delegate = self
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

   
    }
    
    override func loadView() {
        
    }


}

extension NewMemoryViewController: NewMemoryViewModelDelegate {
    func popView() {
        navigationController?.popViewController(animated: true)
    }
    
    func handleViewModelOutput(_ output: NewMemoryViewModelOutput) {
        
    }
    
    
}
