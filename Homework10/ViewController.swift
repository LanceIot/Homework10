//
//  ViewController.swift
//  Homework10
//
//  Created by Админ on 18.01.2023.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    private let bestMovies: [String] = ["Forest Gump", "Star Wars", "Gangs of New York", "Pulp Fiction", "Wiplash", "Blade Runner", "Hacksaw Ridge", "Tick Tick Boom", "Dune", "Dead Poets Society"]
    
    private lazy var topView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.7)
        return view
    }()
    
    private lazy var topLabel: UILabel = {
       let label = UILabel()
        label.text = "NetFLEX"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 30, weight: .regular)
        return label
    }()
    
    private lazy var firstHeaderView: UIView = {
       let view = UIView()
        view.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.85)
        return view
    }()
    
    private lazy var bestMoviesLabel: UILabel = {
       let label = UILabel()
        label.text = "Your top 10 movies"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 25, weight: .regular)
        label.textAlignment = .left
        return label
    }()
    
    private lazy var firstCollectionView: UICollectionView = {
       let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let width = view.frame.height * 0.2
        let height = width * 1.5
        layout.minimumLineSpacing = 17
        layout.itemSize = CGSize(width: width, height: height)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.register(MyFirstCollectionViewCell.self, forCellWithReuseIdentifier: MyFirstCollectionViewCell.IDENTIFIER)
        collectionView.showsVerticalScrollIndicator = false
        return collectionView
    }()
    
    private lazy var secondHeaderView: UIView = {
       let view = UIView()
        view.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.85)
        return view
    }()
    
    private lazy var popularLabel: UILabel = {
       let label = UILabel()
        label.text = "Popular new movies"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 25, weight: .regular)
        label.textAlignment = .left
        return label
    }()
    
    private lazy var secondCollectionView: UICollectionView = {
       let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let height = view.frame.height * 0.25
        let width = height * 0.7
        layout.itemSize = CGSize(width: width, height: height)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.register(SecondCollectionViewCell.self, forCellWithReuseIdentifier: SecondCollectionViewCell.IDENTIFIER)
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        // Do any additional setup after loading the view.
        
        firstCollectionView.dataSource = self
        secondCollectionView.dataSource = self
        
        setupViews()
        setupConstraints()
    }
}

//MARK: - Collection views data source methods

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if(collectionView == firstCollectionView) {
            return 10
        } else {
            return 8
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if(collectionView == firstCollectionView) {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyFirstCollectionViewCell.IDENTIFIER, for: indexPath) as! MyFirstCollectionViewCell
            cell.setImage(with: bestMovies[indexPath.row])
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SecondCollectionViewCell.IDENTIFIER, for: indexPath) as! SecondCollectionViewCell
            cell.setImage(with: bestMovies[indexPath.row])
            return cell
        }
    }
}

//MARK: - Setup views and constraints methods

private extension ViewController {
    
    func setupViews() {
        view.addSubview(topView)
        topView.addSubview(topLabel)
        
        view.addSubview(firstHeaderView)
        firstHeaderView.addSubview(bestMoviesLabel)
        
        view.addSubview(firstCollectionView)
        
        view.addSubview(secondHeaderView)
        secondHeaderView.addSubview(popularLabel)
        
        view.addSubview(secondCollectionView)
        
    }
    
    func setupConstraints() {
        
        topView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.trailing.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.1)
        }
        
        topLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        firstHeaderView.snp.makeConstraints { make in
            make.top.equalTo(topView.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.05)
        }
        
        bestMoviesLabel.snp.makeConstraints { make in
            make.top.trailing.bottom.equalToSuperview()
            make.leading.equalToSuperview().inset(15)
        }
        
        firstCollectionView.snp.makeConstraints { make in
            make.top.equalTo(firstHeaderView.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview().inset(15)
            make.height.equalToSuperview().multipliedBy(0.4)
        }
        
        secondHeaderView.snp.makeConstraints { make in
            make.top.equalTo(firstCollectionView.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.05)
        }
        
        popularLabel.snp.makeConstraints { make in
            make.top.trailing.bottom.equalToSuperview()
            make.leading.equalToSuperview().inset(15)
        }
        
        secondCollectionView.snp.makeConstraints { make in
            make.top.equalTo(secondHeaderView.snp.bottom)
            make.leading.trailing.equalToSuperview().inset(15)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
    }
}



