//
//  ImageText.swift
//  CommonUI
//
//  Created by 최재혁 on 6/10/25.
//

import UIKit

public protocol ImageText {
    func configure(image: UIImage, title : String)
}

public final class VerticalImageText : UIView, ImageText {
    private var imageView : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private var labelView : UILabel = {
        let labelView = UILabel()
        labelView.translatesAutoresizingMaskIntoConstraints = false
        labelView.backgroundColor = .black
        labelView.textAlignment = .center
        labelView.font = UIFont.systemFont(ofSize: 13, weight: .bold)
        labelView.textColor = .white
        labelView.adjustsFontSizeToFitWidth = true
        labelView.minimumScaleFactor = 0.5
        labelView.numberOfLines = 1
        labelView.layer.cornerRadius = 6
        labelView.clipsToBounds = true
        return labelView
    }()
    
    private var stackView : UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 6
        stackView.alignment = .fill
        stackView.distribution = .fill
        return stackView
    }()
    
    override init(frame : CGRect) {
        super.init(frame: frame)
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupHierarchy() {
        addSubview(stackView)
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(labelView)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            imageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.67)
        ])
    }
    
    public func configure(image: UIImage, title : String) {
        imageView.image = image
        labelView.text = title
    }
    
    public func titleConfigure(title : String) {
        labelView.text = title
    }
}
