//
//  CustomButton.swift
//  imokey
//
//  Created by Tugay on 21.12.2022.
//

import UIKit



class CustomButton: UIButton {
    var title: String?
    var image: UIImage?
    
    private let imageLabel: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private let primaryLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .textColor
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        return label
    }()
        
    
    override init(frame: CGRect) {
        self.title = ""
        primaryLabel.text = self.title
        self.image = UIImage(systemName: "pencil")
        imageLabel.image = self.image?.withRenderingMode(.alwaysTemplate)
        imageLabel.tintColor = .textColor ?? .orange
        super.init(frame: frame)
        addSubview(imageLabel)
        addSubview(primaryLabel)
        clipsToBounds = true
        layer.cornerRadius = 30
        layer.borderWidth = 1
        layer.borderColor = UIColor.textColor?.cgColor
        backgroundColor = .bgColor
    }
    
    convenience init( title: String?, image: UIImage?) {
        self.init()
        self.title = title
        primaryLabel.text = title
        self.image = image
        imageLabel.image = image
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let imageSize = self.frame.size.height - 6
        
        imageLabel.frame = CGRect(x: self.frame.size.width / 16, y: 3, width: imageSize, height: imageSize)
        
        primaryLabel.frame = CGRect(x: self.frame.size.width / 16 + imageSize + 6, y: 0, width: self.frame.width - (self.frame.size.width / 8) - imageSize - 6 , height: self.frame.height)
    }

}
