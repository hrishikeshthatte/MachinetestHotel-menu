//
//  nextViewController.swift
//  MachinetestHotel menu
//
//  Created by Student-001 on 12/12/18.
//  Copyright © 2018 ra. All rights reserved.
//

import UIKit

class nextViewController: UIViewController {

    @IBOutlet weak var lbfdprice: UITextField!
    @IBOutlet weak var lbfditem: UITextField!
    
    @IBAction func saveButton(_ sender: UIButton) {
        let insertQuery = "insert into menutable(fooditem, foodprice) values ('\(lbfditem.text!)','\(lbfdprice.text!)')"
        let isSuccess = Dbwraped.sharedObject.executeQuery(query: insertQuery)
        if isSuccess
        {
            print("insert: Successful")
        }
        else
        {
            print("insert : Failed")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
