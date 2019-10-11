//
//  ViewController.swift
//  FocusStartTestTask
//
//  Created by Александр Дергилёв on 09/10/2019.
//  Copyright © 2019 Александр Дергилёв. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, ChangeCarVCDelegate {
    let cellId = "CarCell"
    var cars: [Car] = []
    var tableView: UITableView = UITableView()
    let childVC = ChangeCarVC()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        childVC.delegate = self
        configureNavigationBar()
        getCarsFromUserDefaults()

        view.addSubview(tableView)
        updateLayout(with: self.view.bounds.size)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CarCell.self, forCellReuseIdentifier: cellId)
    }
    
    private func configureNavigationBar() {
        self.title = "Список автомобилей"
        let addBtn = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButton))
        self.navigationItem.setRightBarButton(addBtn, animated: false)
    }
    
    @objc
    func addButton() {
        navigationController?.pushViewController(childVC, animated: false)
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        saveCarsInUserDefaults()
    }
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
       super.viewWillTransition(to: size, with: coordinator)
       coordinator.animate(alongsideTransition: { (contex) in
          self.updateLayout(with: size)
       }, completion: nil)
    }
    
    

    // MARK - UITableView
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! CarCell
        let currentCar = cars[indexPath.row]
        cell.car = currentCar
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cars.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        childVC.currentCar = cars[indexPath.row]
        childVC.indexCurrentCar = indexPath.row
        navigationController?.pushViewController(childVC, animated: false)
    }
    
    // MARK - Private
    private func setStartCarsList() {
        cars.append(Car(yearOfIssue: "2018", manufacturer: "Toyota", model: "Corolla", bodyType: "Sedan"))
        cars.append(Car(yearOfIssue: "2019", manufacturer: "Toyota", model: "Camry", bodyType: "Sedan"))
        cars.append(Car(yearOfIssue: "2018", manufacturer: "Nissan", model: "Teana", bodyType: "Sedan"))
        saveCarsInUserDefaults()
    }

    private func saveCarsInUserDefaults() {
        let encodedData = NSKeyedArchiver.archivedData(withRootObject: cars)
        UserDefaults.standard.set(encodedData, forKey: "cars")
    }

    private func getCarsFromUserDefaults() {
        guard let data = UserDefaults.standard.data(forKey: "cars") else {
            setStartCarsList()
            return
        }
        cars = NSKeyedUnarchiver.unarchiveObject(with: data) as? [Car] ?? []
    }
    
    private func updateLayout(with size: CGSize) {
        self.tableView.frame = CGRect.init(origin: .zero, size: size)
    }
    
    //MARK - delegate
    func saveCar(indexCar: Int?, newCar: Car) {
        if let index = indexCar {
            cars[index].manufacturer = newCar.manufacturer
            cars[index].model = newCar.model
            cars[index].bodyType = newCar.bodyType
            cars[index].yearOfIssue = newCar.yearOfIssue
        } else {
            cars.append(newCar)
        }
        saveCarsInUserDefaults()
        tableView.reloadData()
    }
    
    func deleteCar(indexForRemove: Int) {
        cars.remove(at: indexForRemove)
        saveCarsInUserDefaults()
        tableView.reloadData()
    }
}

