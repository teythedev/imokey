//
//  NewMemoryViewController.swift
//  imokey
//
//  Created by Tugay on 6.01.2023.
//

import UIKit
import MapKit

class NewMemoryViewController: UIViewController {
    
    var textView: UITextView!
    
    var mapView: MKMapView!
    
    var addButton: UIButton!
    
    var viewModel: NewMemoryViewModelProtocol! {
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
        
        placeToolBar()
        placeMapView()
        placeTextView()
        placeAddButton()
        
        activateConstraints()
        setupKeyBoardShowAndHide()
    }
    
    
}

extension NewMemoryViewController: NewMemoryViewModelDelegate {
    func popView() {
        navigationController?.popViewController(animated: true)
    }
    
    func handleViewModelOutput(_ output: NewMemoryViewModelOutput) {
        switch output {
        case .markTheMap(let cLLocationCoordinate2D):
            let annotation = MKPointAnnotation()
            annotation.title = "leave your memory here!"
            annotation.coordinate = cLLocationCoordinate2D
            mapView.showAnnotations([annotation], animated: true)
            mapView.isUserInteractionEnabled = false
        case .showLoading(let bool):
            //todo
            break
        case .showErrorAlert(let string):
            //todo
            break
        }
    }
    
    
}

extension NewMemoryViewController {
    
    func setupKeyBoardShowAndHide() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    @objc func keyboardWillShow(sender: NSNotification) {
        view.frame.origin.y = view.frame.origin.y - 200
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        view.frame.origin.y = 0
    }
    
    func placeToolBar(){
        let recordAudioButton = UIBarButtonItem(image: UIImage(systemName:"mic.circle"), style: .done, target: self, action: #selector(recordAudioTapped))
        let captureImageButton = UIBarButtonItem(image: UIImage(systemName:"camera.circle"), style: .done, target: self, action: #selector(captureImageTapped))
        navigationItem.rightBarButtonItems = [recordAudioButton, captureImageButton]
    }
    
    @objc func recordAudioTapped() {
        
    }
    @objc func captureImageTapped() {
        
    }
    
    func placeMapView() {
        mapView = MKMapView()
        mapView.layer.borderColor = UIColor.textColor?.cgColor
        mapView.layer.cornerRadius = 10
        mapView.layer.borderWidth = 1
        mapView.translatesAutoresizingMaskIntoConstraints = false
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(mapTapped))
        mapView.addGestureRecognizer(tapGesture)
        view.addSubview(mapView)
    }
    
    @objc func mapTapped() {
        viewModel.requestLocation()
    }
    
    func placeTextView() {
        
        textView = UITextView()
        textView.layer.borderColor = UIColor.textColor?.cgColor
        textView.layer.cornerRadius = 10
        textView.layer.borderWidth = 1
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.addDoneButton(title: "Done", target: self, selector: #selector(tapDone))
        view.addSubview(textView)
    }
    
    @objc func tapDone(sender: Any) {
        self.view.endEditing(true)
    }
    
    
    func placeAddButton() {
        addButton = UIButton()
        addButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(addButton)
    }
    
    func activateConstraints() {
        NSLayoutConstraint.activate([
            mapView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mapView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3),
            mapView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            mapView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            textView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3),
            textView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            textView.topAnchor.constraint(equalTo: mapView.bottomAnchor, constant: 10),
        ])
    }
}


