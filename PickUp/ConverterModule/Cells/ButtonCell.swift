//
//  ButtonCell.swift
//  PickUp
//
//  Created by Peter on 04.10.2024.
//

import Foundation
import UIKit

class ButtonCell: UICollectionViewCell {
    
    //MARK: Identifier
    
    static let identifier = "ButtonCell"
    
    //MARK: SubViews
    
    private let valueTitle = UILabel()
    
    //MARK: Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle

    override func prepareForReuse() {
        super.prepareForReuse()
        valueTitle.text = nil
        valueTitle.textColor = nil
        contentView.backgroundColor = nil
    }
    
    //MARK: Methods
    
    func configure(text: String, color: UIColor, textColor: UIColor) {
        
        valueTitle.text = text
        valueTitle.textColor = textColor
        contentView.backgroundColor = color
    }
    
    //MARK: SetUp
    
    private func setUp() {
        
        contentView.layer.cornerRadius = 40
        setUpValueTitle()
    }
    
    private func setUpValueTitle() {
        
        valueTitle.font = .systemFont(ofSize: 36)
        valueTitle.numberOfLines = 1
        valueTitle.textAlignment = .center
        valueTitle.translatesAutoresizingMaskIntoConstraints = false
        
        let valueTitleConstraints = [
        
            valueTitle.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            valueTitle.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ]
        
        contentView.addSubview(valueTitle)
        NSLayoutConstraint.activate(valueTitleConstraints)
    }
}
