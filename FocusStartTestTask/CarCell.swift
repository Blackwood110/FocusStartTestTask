//
//  CarCell.swift
//  FocusStartTestTask
//
//  Created by Александр Дергилёв on 09/10/2019.
//  Copyright © 2019 Александр Дергилёв. All rights reserved.
//

import UIKit

class CarCell: UITableViewCell {
    var car: Car? {
        didSet {
            yearLabel.text = "Год выпуска: " + (car?.yearOfIssue ?? "")
            manufacturerLabel.text = "Производитель: " + (car?.manufacturer ?? "")
            modelLabel.text = "Модель: " + (car?.model ?? "")
            typeLabel.text = "Тип кузова: " + (car?.bodyType ?? "")
        }
    }
    
    private let yearLabel: UILabel = {
        let lb = UILabel()
        lb.textAlignment = .left
        lb.font = .systemFont(ofSize: 14)
        return lb
    }()
    
    private let manufacturerLabel: UILabel = {
        let lb = UILabel()
        lb.textAlignment = .left
        lb.font = .systemFont(ofSize: 14)
        return lb
    }()
    
    private let modelLabel: UILabel = {
        let lb = UILabel()
        lb.textAlignment = .left
        lb.font = .systemFont(ofSize: 14)
        return lb
    }()
    
    private let typeLabel: UILabel = {
        let lb = UILabel()
        lb.textAlignment = .left
        lb.font = .systemFont(ofSize: 14)
        return lb
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(manufacturerLabel)
        contentView.addSubview(modelLabel)
        contentView.addSubview(typeLabel)
        contentView.addSubview(yearLabel)
        
        manufacturerLabel.translatesAutoresizingMaskIntoConstraints = false
        manufacturerLabel.topAnchor.constraint(equalToSystemSpacingBelow: contentView.topAnchor, multiplier: 0.5).isActive = true
        manufacturerLabel.leftAnchor.constraint(equalToSystemSpacingAfter: contentView.leftAnchor, multiplier: 2).isActive = true
        manufacturerLabel.rightAnchor.constraint(greaterThanOrEqualToSystemSpacingAfter: contentView.rightAnchor, multiplier: 2).isActive = true
        
        modelLabel.translatesAutoresizingMaskIntoConstraints = false
        modelLabel.topAnchor.constraint(equalToSystemSpacingBelow: manufacturerLabel.bottomAnchor, multiplier: 0.5).isActive = true
        modelLabel.leftAnchor.constraint(equalToSystemSpacingAfter: contentView.leftAnchor, multiplier: 2).isActive = true
        modelLabel.rightAnchor.constraint(greaterThanOrEqualToSystemSpacingAfter: contentView.rightAnchor, multiplier: 2).isActive = true
        
        typeLabel.translatesAutoresizingMaskIntoConstraints = false
        typeLabel.topAnchor.constraint(equalToSystemSpacingBelow: modelLabel.bottomAnchor, multiplier: 0.5).isActive = true
        typeLabel.leftAnchor.constraint(equalToSystemSpacingAfter: contentView.leftAnchor, multiplier: 2).isActive = true
        typeLabel.rightAnchor.constraint(greaterThanOrEqualToSystemSpacingAfter: contentView.rightAnchor, multiplier: 2).isActive = true
        
        yearLabel.translatesAutoresizingMaskIntoConstraints = false
        yearLabel.topAnchor.constraint(equalToSystemSpacingBelow: typeLabel.bottomAnchor, multiplier: 0.5).isActive = true
        yearLabel.leftAnchor.constraint(equalToSystemSpacingAfter: contentView.leftAnchor, multiplier: 2).isActive = true
        yearLabel.rightAnchor.constraint(greaterThanOrEqualToSystemSpacingAfter: contentView.rightAnchor, multiplier: 2).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
