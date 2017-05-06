//
//  AddStudentViewController.swift
//  Management_Student
//
//  Created by Duy Bùi on 5/6/17.
//  Copyright © 2017 Duy Bùi. All rights reserved.
//

import UIKit

class AddStudentViewController: UIViewController {

    
    @IBOutlet weak var txtOld: UITextField!
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtUniversity: UITextField!
    @IBOutlet weak var txtDescription: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        txtOld.keyboardType = UIKeyboardType.decimalPad
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func btnSave(_ sender: UIBarButtonItem) {
        if txtName.text!.isEmpty || txtUniversity.text!.isEmpty ||  txtDescription.text!.isEmpty ||  txtOld.text!.isEmpty {
            //create alert
            let alert = UIAlertController(title: "Thông Báo", message: "Bạn phải nhập đầy đủ thông tin", preferredStyle: UIAlertControllerStyle.alert);
            //add an action
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil));
            //show alert
            self.present(alert, animated: true, completion: nil);

        }
        else {
            Constants.isLoadDataAgain = true
            let student: Student = Student(name: txtName.text!, university: txtUniversity.text!, description: txtDescription.text!, yearOld: Int(txtOld.text!)!)
            Constants.student = student
            self.navigationController?.popViewController(animated: true)
    }
       
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        txtOld.resignFirstResponder()
        txtDescription.resignFirstResponder()
        txtUniversity.resignFirstResponder()
        txtName.resignFirstResponder()
        return true
    }
    
    @IBAction func userTappedBackground(sender: AnyObject){
        txtOld.resignFirstResponder()
        txtDescription.resignFirstResponder()
        txtUniversity.resignFirstResponder()
        txtName.resignFirstResponder()    }
    
    @IBAction func userTappedBackGround(_ sender: Any){
        view.endEditing(true)
    }

}
