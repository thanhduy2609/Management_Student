//
//  StudentTableViewController.swift
//  Management_Student
//
//  Created by Duy Bùi on 5/6/17.
//  Copyright © 2017 Duy Bùi. All rights reserved.
//

import UIKit

class StudentTableViewController: UITableViewController {

    
    
    //get all event in day
    lazy var students: [Student] = {
        return Student.createStudent()
    }()
    
    var filteredStudent = [Student]()
    
    
    let searchController = UISearchController(searchResultsController: nil)

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup the Search Controller
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        definesPresentationContext = true
        searchController.dimsBackgroundDuringPresentation = false


        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        tableView.estimatedRowHeight = tableView.rowHeight
        tableView.rowHeight = UITableViewAutomaticDimension
        
        tableView.tableHeaderView = searchController.searchBar


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        //return students.count
        if searchController.isActive && searchController.searchBar.text != "" {
            return filteredStudent.count
        }
        return students.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "StudentCell", for: indexPath) as! StudentCell
        
        let student: Student;
        if searchController.isActive && searchController.searchBar.text != "" {
            student = filteredStudent[indexPath.row]
        } else {
            student = students[indexPath.row]
        }
        cell.configCellWith(student: student)
        return cell
    }
    
    func filterContentForSearchText(_ searchText: String) {
        filteredStudent = students.filter({(student : Student) -> Bool in
            return student.name.lowercased().contains(searchText.lowercased())
        })
        tableView.reloadData()
    }


}

extension StudentTableViewController: UISearchBarDelegate {
    // MARK: - UISearchBar Delegate
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        filterContentForSearchText(searchBar.text!)
    }
}

extension StudentTableViewController: UISearchResultsUpdating {
    // MARK: - UISearchResultsUpdating Delegate
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        //let scope = searchBar.scopeButtonTitles![searchBar.selectedScopeButtonIndex]
        filterContentForSearchText(searchController.searchBar.text!)
    }
}
