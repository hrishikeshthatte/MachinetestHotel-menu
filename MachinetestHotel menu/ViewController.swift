//
//  ViewController.swift
//  MachinetestHotel menu
//
//  Created by Student-001 on 12/12/18.
//  Copyright © 2018 ra. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var allfdname = [String]()
    var allfdprice = [String]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allfdname.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .value1, reuseIdentifier: "Cell")
        cell.textLabel?.text = allfdprice[indexPath.row]
        cell.detailTextLabel?.text = allfdname[indexPath.row]
        return cell
    }
    
    

    @IBOutlet weak var menutbview: UITableView!
    
    
    @IBAction func addbutton(_ sender: UIBarButtonItem) {
        let next = self.storyboard?.instantiateViewController(withIdentifier: "nextViewController")as! nextViewController
        navigationController?.pushViewController(next, animated: true)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let selectQuery = "select fooditem,foodprice from menutable"
        Dbwraped.sharedObject.selectAlltask(query: selectQuery)
        allfdname = Dbwraped.sharedObject.fooditemArray!
        allfdprice = Dbwraped.sharedObject.foodpriceArray!
        if (allfdname.count > 0)
        {
            print(allfdname)
            print(allfdprice)
        }
        menutbview.reloadData()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(_ animated: Bool) {
        let selectQuery = "select fooditem,foodprice from menutable"
        Dbwraped.sharedObject.selectAlltask(query: selectQuery)
        allfdname = Dbwraped.sharedObject.fooditemArray!
        allfdprice = Dbwraped.sharedObject.foodpriceArray!
        if (allfdname.count > 0)
        {
            print(allfdname)
            print(allfdprice)
        }
        menutbview.reloadData()
    }
}

