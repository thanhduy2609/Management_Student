//
//  StudentCell.swift
//  Management_Student
//
//  Created by Duy Bùi on 5/6/17.
//  Copyright © 2017 Duy Bùi. All rights reserved.
//

import UIKit

class StudentCell: UITableViewCell {

    
    @IBOutlet weak var lblStudentName: UILabel!

    @IBOutlet weak var lblStudentYearOld: UILabel!
    @IBOutlet weak var lblUniversity: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    
    func configCellWith(student: Student) {
        lblStudentName.text! = student.name
        lblStudentYearOld.text! = String(student.yearOld)
        lblUniversity.text! = student.university
        lblDescription.text! = student.description
    }
}
