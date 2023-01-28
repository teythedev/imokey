//
//  NewMemoryViewController.swift
//  imokey
//
//  Created by Tugay on 6.01.2023.
//

import UIKit
import MapKit

final class NewMemoryViewController: UIViewController {
    
    var textView: UITextView!
    
    var mapView: MKMapView!
    
    var addButton: UIButton!
    
    var recordAndStopButton: UIButton!
    
    var playAndStopButton: UIButton!
    
    var viewModel: NewMemoryViewModelProtocol! {
        didSet {
            viewModel.delegate = self
        }
    }
    
    weak var coordinator: NewMemoryCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = UIColor.bgColor
        
        placeMapView()
        
        placeRecordButton()
        placePlayButton()
        
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
        case .changeRecordButton(let changeRecord):
            switch changeRecord {
            case .Record:
                recordAndStopButton.setImage(UIImage(systemName: "record.circle"), for: .normal)
                recordAndStopButton.removeTarget(self, action: #selector(stopRecordTapped), for: .touchUpInside)
                recordAndStopButton.addTarget(self, action: #selector(recordTapped), for: .touchUpInside)
            case .Stop:
                recordAndStopButton.setImage(UIImage(systemName: "stop.circle"), for: .normal)
                recordAndStopButton.removeTarget(self, action: #selector(recordTapped), for: .touchUpInside)
                recordAndStopButton.addTarget(self, action: #selector(stopRecordTapped), for: .touchUpInside)
            }
        case .changePlayButton(let changePlay):
            switch changePlay {
            case .Play:
                playAndStopButton.setImage(UIImage(systemName: "play.circle"), for: .normal)
                playAndStopButton.removeTarget(self, action: #selector(stopPlayTapped), for: .touchUpInside)
                playAndStopButton.addTarget(self, action: #selector(playTapped), for: .touchUpInside)
            case .Stop:
                playAndStopButton.setImage(UIImage(systemName: "stop.circle"), for: .normal)
                playAndStopButton.removeTarget(self, action: #selector(playTapped), for: .touchUpInside)
                playAndStopButton.addTarget(self, action: #selector(stopPlayTapped), for: .touchUpInside)
            }
        case .enablePlayButton(let enablePlayButton):
            playAndStopButton.isEnabled = enablePlayButton
        case .enableRecordButton(let enableRecordButton):
            recordAndStopButton.isEnabled = enableRecordButton
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
    
    @objc func recordTapped(sender: UIButton) {
        viewModel.record()
    }
    
    @objc func stopRecordTapped(sender: UIButton) {
        viewModel.stopRecord()
    }
    
    @objc func playTapped(sender: UIButton) {
        viewModel.playAudio()
    }
    
    @objc func stopPlayTapped(sender: UIButton) {
        viewModel.stopAudio()
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
    
    func placeRecordButton() {
        recordAndStopButton = UIButton(type: .custom)
        recordAndStopButton.translatesAutoresizingMaskIntoConstraints = false
        recordAndStopButton.layer.cornerRadius = 0.5 * recordAndStopButton.bounds.size.width
        recordAndStopButton.clipsToBounds = true
        recordAndStopButton.setImage(UIImage(systemName: "record.circle"), for: .normal)
        recordAndStopButton.addTarget(self, action: #selector(recordTapped), for: .touchUpInside)
        recordAndStopButton.tintColor = UIColor.textColor
        view.addSubview(recordAndStopButton)
        
    }
    func placePlayButton() {
        playAndStopButton = UIButton(type: .custom)
        playAndStopButton.translatesAutoresizingMaskIntoConstraints = false
        playAndStopButton.layer.cornerRadius = 0.5 * playAndStopButton.bounds.size.width
        playAndStopButton.clipsToBounds = true
        playAndStopButton.isEnabled = false
        playAndStopButton.setImage(UIImage(systemName: "play.circle"), for: .normal)
        playAndStopButton.addTarget(self, action: #selector(playTapped), for: .touchUpInside)
        playAndStopButton.tintColor = UIColor.textColor
        view.addSubview(playAndStopButton)
        
    }
    
    @objc func mapTapped() {
        //viewModel.requestLocation()
        viewModel.saveMemory()
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
            
            recordAndStopButton.topAnchor.constraint(equalTo: textView.bottomAnchor, constant: 10),
            recordAndStopButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -30),
            recordAndStopButton.heightAnchor.constraint(equalToConstant: 50),
            recordAndStopButton.widthAnchor.constraint(equalToConstant: 50),
            
            playAndStopButton.topAnchor.constraint(equalTo: textView.bottomAnchor, constant: 10),
            playAndStopButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 30),
            playAndStopButton.heightAnchor.constraint(equalToConstant: 50),
            playAndStopButton.widthAnchor.constraint(equalToConstant: 50),
            
        ])
    }
}


