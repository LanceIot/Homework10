//
//  MyFirstCollectionViewCell.swift
//  Homework10
//
//  Created by Админ on 19.01.2023.
//

import UIKit

class MyFirstCollectionViewCell: UICollectionViewCell {
    
    static let IDENTIFIER = "MyFirstCollectionViewCell"
    
    private lazy var myImage: UIImageView = {
       let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.image = UIImage(named: "Tick Tick Boom")
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.backgroundColor = .systemOrange
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setImage(with newImage: String) {
        myImage.image = UIImage(named: newImage)
        myImage.contentMode = .scaleAspectFit
    }
}

//MARK: - Setup views and constraints

private extension MyFirstCollectionViewCell {
    func setupViews() {
        contentView.addSubview(myImage)
    }
    
    func setupConstraints() {
        myImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
