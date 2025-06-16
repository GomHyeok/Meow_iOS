//
//  ImageText.swift
//  CommonUI
//
//  Created by 최재혁 on 6/10/25.
//

import UIKit

public final class VerticalImageText : UIView {
    private var emptyView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var imageView : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private var textView : UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.backgroundColor = .black
        textView.textAlignment = .center
        textView.font = UIFont.systemFont(ofSize: 13, weight: .medium)
        textView.textColor = .white
        return textView
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
        emptyView.addSubview(imageView)
        emptyView.addSubview(textView)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            emptyView.heightAnchor.constraint(equalToConstant: 98),
            emptyView.widthAnchor.constraint(equalToConstant: 72)
        ])
    }
    
    public func configure(image: UIImage, title : String) {
        imageView.image = image
        textView.text = title
    }
    
    public func setViewLayout() {
        
    }
}
