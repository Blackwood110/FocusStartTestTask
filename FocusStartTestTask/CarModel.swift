//
//  CarModel.swift
//  FocusStartTestTask
//
//  Created by Александр Дергилёв on 09/10/2019.
//  Copyright © 2019 Александр Дергилёв. All rights reserved.
//

import Foundation

class Car: NSObject, NSCoding {
    var yearOfIssue: String
    var manufacturer: String
    var model: String
    var bodyType: String
    
    init(yearOfIssue: String, manufacturer: String, model: String, bodyType: String) {
        self.yearOfIssue = yearOfIssue;
        self.manufacturer = manufacturer;
        self.model = model;
        self.bodyType = bodyType;
    }
    
    required init?(coder: NSCoder) {
        self.yearOfIssue = coder.decodeObject(forKey: "yearOfIssue") as? String ?? ""
        self.manufacturer = coder.decodeObject(forKey: "manufacturer") as? String ?? ""
        self.model = coder.decodeObject(forKey: "model") as? String ?? ""
        self.bodyType = coder.decodeObject(forKey: "bodyType") as? String ?? ""
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(yearOfIssue, forKey: "yearOfIssue")
        coder.encode(manufacturer, forKey: "manufacturer")
        coder.encode(model, forKey: "model")
        coder.encode(bodyType, forKey: "bodyType")
    }
}
