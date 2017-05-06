//
//  StudentDetailViewController.swift
//  Management_Student
//
//  Created by Duy Bùi on 5/6/17.
//  Copyright © 2017 Duy Bùi. All rights reserved.
//

import UIKit

class StudentDetailViewController: UIViewController {

    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblOld: UILabel!
    @IBOutlet weak var lblUniversity: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    
    var student: Student!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        lblName.text! = student.name
        lblOld.text! = String(student.yearOld)
        lblUniversity.text! = student.university
        lblDescription.text! = student.description
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
