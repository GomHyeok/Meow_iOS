//
//  HomeViewController.swift
//  HomeModule
//
//  Created by 최재혁 on 5/22/25.
//

import UIKit
import RxSwift
import RxCocoa
import BaseFeature
import CommonUI

public final class HomeViewController : BaseViewController {
    
    private let viewModel : HomeViewModelProtocol
    
    public init(viewModel : HomeViewModelProtocol) {
        self.viewModel = viewModel
        super.init()
    }
    
    @MainActor required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override public func setupHierarchy() {
        view.addSubview(background)
        view.addSubview(shopImageText)
        view.addSubview(settingImageText)
    }
    
    override public func setupViewProperty() {
        shopImageText.configure(image: UIImage(systemName: "cart")!, title: "")
        settingImageText.configure(image: UIImage(systemName: "gearshape")!, title: "")
    }
    
    public override func setupBind() {
        self.rx.viewDidLoad
            .bind(to: self.viewModel.viewDidLoad)
            .disposed(by: disposeBag)
        
        self.viewModel.updateStaticUI
            .drive(onNext : { [weak self] homeRO in
                guard let self = self else { return }
                self.shopImageText.titleConfigure(title: homeRO.shop)
                self.settingImageText.titleConfigure(title: homeRO.setting)
            })
            .disposed(by: disposeBag)
    }
    
    override public func setupLayout() {
        // Background
        NSLayoutConstraint.activate([
            background.topAnchor.constraint(equalTo: view.topAnchor),
            background.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            background.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            background.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        // ImageTexts
        NSLayoutConstraint.activate([
            shopImageText.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 11),
            shopImageText.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            shopImageText.heightAnchor.constraint(equalToConstant: 70),
            shopImageText.widthAnchor.constraint(equalToConstant: 49)
        ])
        
        NSLayoutConstraint.activate([
            settingImageText.topAnchor.constraint(equalTo: shopImageText.bottomAnchor, constant: 11),
            settingImageText.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            settingImageText.heightAnchor.constraint(equalToConstant: 70),
            settingImageText.widthAnchor.constraint(equalToConstant: 49)
        ])
    }
    
    private var background : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = CommonUIAsset.homeCat.image
        return imageView
    }()
    
    private var shopImageText : VerticalImageText = {
        let imageText = VerticalImageText()
        imageText.translatesAutoresizingMaskIntoConstraints = false
        return imageText
    }()
    
    private var settingImageText : VerticalImageText = {
        let imageText = VerticalImageText()
        imageText.translatesAutoresizingMaskIntoConstraints = false
        return imageText
    }()
    
    private var infoView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        view.layer.cornerRadius = 9
        return view
    }()
    
    private var infoLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var affectionView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .red
        view.layer.cornerRadius = 9
        return view
    }()
    
    private var affectionLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
}
