//
//  File.swift
//  Employee_Manager
//
//  Created by JETS Mobile Lab - 2 on 5/5/19.
//  Copyright © 2019 ITI. All rights reserved.
//

import Foundation
class Person{
    var salary : Double?
    
    func getSalary()->Double{
        return salary!
    }
}

class Manager : Person{
    override func getSalary()->Double{
        return salary! * 2
    }
}

class Employee : Person{
    override func getSalary()->Double{
        return salary! * 1.5
    }
}
