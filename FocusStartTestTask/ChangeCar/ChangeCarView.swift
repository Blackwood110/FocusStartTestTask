//
//  ChangeCarView.swift
//  FocusStartTestTask
//
//  Created by Александр Дергилёв on 10/10/2019.
//  Copyright © 2019 Александр Дергилёв. All rights reserved.
//

import UIKit

class ChangeCarView: UIView {
    var carInfo: Car? {
        didSet {
            tfYear.text = carInfo?.yearOfIssue
            tfType.text = carInfo?.bodyType
            tfManufacturer.text = carInfo?.manufacturer
            tfModel.text = carInfo?.model
        }
    }
    
    let tfYear = UITextField()
    let tfManufacturer = UITextField()
    let tfModel = UITextField()
    let tfType = UITextField()
    
    private let yearLabel: UILabel = {
           let lb = UILabel()
           lb.textAlignment = .left
           lb.font = .systemFont(ofSize: 14)
           lb.text = "Год выпуска: "
           return lb
       }()
       
       private let manufacturerLabel: UILabel = {
           let lb = UILabel()
           lb.textAlignment = .left
           lb.font = .systemFont(ofSize: 14)
           lb.text = "Производитель: "
           return lb
       }()
       
       private let modelLabel: UILabel = {
           let lb = UILabel()
           lb.textAlignment = .left
           lb.font = .systemFont(ofSize: 14)
           lb.text = "Модель: "
           return lb
       }()
       
       private let typeLabel: UILabel = {
           let lb = UILabel()
           lb.textAlignment = .left
           lb.font = .systemFont(ofSize: 14)
           lb.text = "Тип кузова: "
           return lb
       }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        addSubview(manufacturerLabel)
        manufacturerLabel.translatesAutoresizingMaskIntoConstraints = false
        manufacturerLabel.topAnchor.constraint(equalTo: topAnchor, constant: 6).isActive = true
        manufacturerLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 2).isActive = true
        manufacturerLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        manufacturerLabel.widthAnchor.constraint(equalToConstant: 110).isActive = true
        
        addSubview(tfManufacturer)
        tfManufacturer.translatesAutoresizingMaskIntoConstraints = false
        tfManufacturer.topAnchor.constraint(equalTo: topAnchor, constant: 2).isActive = true
        tfManufacturer.leftAnchor.constraint(equalTo: manufacturerLabel.rightAnchor, constant: 2).isActive = true
        tfManufacturer.rightAnchor.constraint(equalTo: rightAnchor, constant: -2).isActive = true
        tfManufacturer.placeholder = "Введите производителя"
        tfManufacturer.keyboardType = .asciiCapable
        tfManufacturer.borderStyle = .roundedRect
        
        addSubview(modelLabel)
        modelLabel.translatesAutoresizingMaskIntoConstraints = false
        modelLabel.topAnchor.constraint(equalTo: tfManufacturer.bottomAnchor, constant: 6).isActive = true
        modelLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 2).isActive = true
        modelLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        modelLabel.widthAnchor.constraint(equalToConstant: 110).isActive = true
        
        addSubview(tfModel)
        tfModel.translatesAutoresizingMaskIntoConstraints = false
        tfModel.topAnchor.constraint(equalTo: tfManufacturer.bottomAnchor, constant: 2).isActive = true
        tfModel.leftAnchor.constraint(equalTo: modelLabel.rightAnchor, constant: 2).isActive = true
        tfModel.rightAnchor.constraint(equalTo: rightAnchor, constant: -2).isActive = true
        tfModel.placeholder = "Введите модель"
        tfModel.keyboardType = .default
        tfModel.borderStyle = .roundedRect
        
        addSubview(typeLabel)
        typeLabel.translatesAutoresizingMaskIntoConstraints = false
        typeLabel.topAnchor.constraint(equalTo: tfModel.bottomAnchor, constant: 6).isActive = true
        typeLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 2).isActive = true
        typeLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        typeLabel.widthAnchor.constraint(equalToConstant: 110).isActive = true
        
        addSubview(tfType)
        tfType.translatesAutoresizingMaskIntoConstraints = false
        tfType.topAnchor.constraint(equalTo: tfModel.bottomAnchor, constant: 2).isActive = true
        tfType.leftAnchor.constraint(equalTo: typeLabel.rightAnchor, constant: 2).isActive = true
        tfType.rightAnchor.constraint(equalTo: rightAnchor, constant: -2).isActive = true
        tfType.placeholder = "Введите тип кузова"
        tfType.keyboardType = .default
        tfType.borderStyle = .roundedRect
        
        addSubview(yearLabel)
        yearLabel.translatesAutoresizingMaskIntoConstraints = false
        yearLabel.topAnchor.constraint(equalTo: tfType.bottomAnchor, constant: 6).isActive = true
        yearLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 2).isActive = true
        yearLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        yearLabel.widthAnchor.constraint(equalToConstant: 110).isActive = true
        
        addSubview(tfYear)
        tfYear.translatesAutoresizingMaskIntoConstraints = false
        tfYear.topAnchor.constraint(equalTo: tfType.bottomAnchor, constant: 2).isActive = true
        tfYear.leftAnchor.constraint(equalTo: yearLabel.rightAnchor, constant: 2).isActive = true
        tfYear.rightAnchor.constraint(equalTo: rightAnchor, constant: -2).isActive = true
        tfYear.placeholder = "Введите год выпуска"
        tfYear.keyboardType = .numberPad
        tfYear.borderStyle = .roundedRect
    }
}
