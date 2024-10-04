//
//  ViewController.swift
//  PickUp
//
//  Created by Peter on 23.09.2024.
//

import UIKit

class ConverterViewController: UIViewController {
    
    //MARK: Properties
    
    var buttons: [Buttons] = [
        .clear, .negative, .percent, .divide,
        .seven, .eight, .nine, .multiple,
        .four, .five, .six, .minus,
        .one, .two, .three, .plus,
        .zero, .dec, .equal
    ]
    
    //MARK: SubViews
    
    var collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    //MARK: LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setUp()
    }
    
    //MARK: SetUp
    
    private func setUp() {
        
        view.backgroundColor = .black
        collectionView.dataSource = self
        collectionView.delegate = self
        
        setUpCollectionView()
    }
    
    private func setUpCollectionView() {
        
        collectionView.showsVerticalScrollIndicator = false
        collectionView.backgroundColor = .clear
        collectionView.register(ButtonCell.self, forCellWithReuseIdentifier: ButtonCell.identifier)
        collectionView.alwaysBounceVertical = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        let collectionViewConstraints = [
        
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -(self.view.frame.width / 4) * 5),
            collectionView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 14),
            collectionView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -14),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ]
        view.addSubview(collectionView)
        NSLayoutConstraint.activate(collectionViewConstraints)
    }
}

//MARK: UICollectionViewDataSource

extension ConverterViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        buttons.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: ButtonCell.identifier,
            for: indexPath)
        as? ButtonCell else { return UICollectionViewCell() }
        
        cell.configure(text: buttons[indexPath.item].rawValue, color: buttons[indexPath.item].color, textColor: buttons[indexPath.item].textColor)
        
        return cell
    }
}

//MARK: UICollectionViewDelegateFlowLayout

extension ConverterViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if buttons[indexPath.item].rawValue == "0" {
            return CGSize(width: (self.view.frame.width - 70) / 2 + 14, height: (self.view.frame.width - 70) / 4)
        } else {
            return CGSize(width: (self.view.frame.width - 70) / 4, height: (self.view.frame.width - 70) / 4)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        14
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        14
    }
    
}
