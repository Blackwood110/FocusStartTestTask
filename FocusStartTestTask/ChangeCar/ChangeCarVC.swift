//
//  ChangeCarVC.swift
//  FocusStartTestTask
//
//  Created by Александр Дергилёв on 10/10/2019.
//  Copyright © 2019 Александр Дергилёв. All rights reserved.
//

import UIKit
protocol ChangeCarVCDelegate: class {
    func saveCar(indexCar: Int?, newCar: Car)
    func deleteCar(indexForRemove: Int)
}

class ChangeCarVC: UIViewController {
    var currentCar: Car?
    var indexCurrentCar: Int?
    let changeCarView = ChangeCarView()
    weak var delegate: ChangeCarVCDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(false)
        guard let car = currentCar else {
            return
        }
        changeCarView.tfManufacturer.text = car.manufacturer
        changeCarView.tfModel.text = car.model
        changeCarView.tfType.text = car.bodyType
        changeCarView.tfYear.text = car.yearOfIssue
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        changeCarView.tfYear.text = ""
        changeCarView.tfType.text = ""
        changeCarView.tfModel.text = ""
        changeCarView.tfManufacturer.text = ""
        currentCar = nil
        indexCurrentCar = nil
    }
    private func configure() {
        configureNavigationBar()
        let height = navigationController?.navigationBar.frame.maxY ?? 0
        view.addSubview(changeCarView)
        changeCarView.translatesAutoresizingMaskIntoConstraints = false
        changeCarView.topAnchor.constraint(equalTo: view.topAnchor, constant: height).isActive = true
        changeCarView.leftAnchor.constraint(equalToSystemSpacingAfter: view.leftAnchor, multiplier: 0).isActive = true
        changeCarView.rightAnchor.constraint(equalToSystemSpacingAfter: view.rightAnchor, multiplier: 0).isActive = true
        changeCarView.bottomAnchor.constraint(equalToSystemSpacingBelow: view.bottomAnchor, multiplier: 0).isActive = true
    }
    
    private func configureNavigationBar() {
        let saveBtn = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(clickOnSaveBtn))
        let deleteBtn = UIBarButtonItem(barButtonSystemItem: .trash, target: self, action: #selector(clickOnRemoveBtn))
        self.navigationItem.setRightBarButtonItems([deleteBtn, saveBtn], animated: false)
    }
    
    @objc
    func clickOnSaveBtn() {
        guard let tfMan = changeCarView.tfManufacturer.text, let tfMod = changeCarView.tfModel.text,
        let tfType = changeCarView.tfType.text, let tfYear = changeCarView.tfYear.text
             else {
                return
        }
        if (tfMan.isEmpty || tfMod.isEmpty || tfType.isEmpty || tfYear.isEmpty) {
            let alert = UIAlertController(title: "Сохранение", message: "Не все поля заполнены", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                  switch action.style{
                  case .default:
                        print("default")

                  case .cancel:
                        print("cancel")

                  case .destructive:
                        print("destructive")
            }}))
            self.present(alert, animated: true, completion: nil)
            return
        }
        let currentCar = Car(yearOfIssue: tfYear, manufacturer: tfMan, model: tfMod, bodyType: tfType)
        delegate?.saveCar(indexCar: indexCurrentCar, newCar: currentCar)
        navigationController?.popViewController(animated: false)
    }
    
    @objc
    func clickOnRemoveBtn() {
        guard let index = indexCurrentCar else {
            return
        }
        delegate?.deleteCar(indexForRemove: index)
        navigationController?.popViewController(animated: false)
    }
}
