//
//  ViewController.swift
//  Employee_Manager
//
//  Created by JETS Mobile Lab - 2 on 5/5/19.
//  Copyright © 2019 ITI. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var salaryTextField: UITextField!
    var emp = Employee()
    var mgr = Manager()
    @IBOutlet weak var salaryLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func getEmployeeSalary(_ sender: UIButton) {
        emp.salary = Double(salaryTextField.text!)
        salaryLabel.text? = "Employee Salary = " + String(emp.getSalary())
        
    }
    
    @IBAction func getManagerSalary(_ sender: UIButton) {
        
        mgr.salary = Double(salaryTextField.text!)
        salaryLabel.text? = "Manager Salary = " + String(mgr.getSalary())
    }
}

