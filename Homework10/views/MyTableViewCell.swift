//
//  MyTableViewCell.swift
//  Homework10
//
//  Created by Админ on 19.01.2023.
//

import UIKit

class MyTableViewCell: UITableViewCell {
    
    static let IDENTIFIER = "MyTableViewCell"
    
    private lazy var itemCollectionView: UICollectionView = {
       let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 80, height: 80)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.register(MyFirstCollectionViewCell.self, forCellWithReuseIdentifier: MyFirstCollectionViewCell.IDENTIFIER)
        return collectionView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        itemCollectionView.dataSource = self
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - Collection views data source methods

extension MyTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyFirstCollectionViewCell.IDENTIFIER, for: indexPath)
        return cell
    }
}

//MARK: - Setup views and constraints methods

private extension MyTableViewCell {
    
    func setupViews() {
        contentView.addSubview(itemCollectionView)
        
    }
    
    func setupConstraints() {
        itemCollectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}



