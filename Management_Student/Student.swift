//
//  Student.swift
//  Management_Student
//
//  Created by Duy Bùi on 5/6/17.
//  Copyright © 2017 Duy Bùi. All rights reserved.
//

import Foundation

class Student {
    var name: String
    var university: String
    var description: String
    var yearOld: Int
    
    init(name: String, university: String, description: String, yearOld: Int) {
        self.name = name
        self.university = university
        self.description = description
        self.yearOld = yearOld
    }
    
    class func createStudent() -> [Student]{
        var students = [Student]()
        
        students.append(Student(name: "Bùi Vũ Thanh Duy", university: "University of Technology and Education Ho Chi Minh city", description: "Không", yearOld: 22))
        
        students.append(Student(name: "Nguyễn Anh Kiệt", university: "University of Technology and Education Ho Chi Minh city", description: "Không", yearOld: 22))

        return students
    }
}
