//
//  Dbwraped.swift
//  MachinetestHotel menu
//
//  Created by Student-001 on 12/12/18.
//  Copyright © 2018 ra. All rights reserved.
//

import UIKit
import SQLite3
class Dbwraped: NSObject {
    var db : OpaquePointer?
    var stmt : OpaquePointer?
    var fooditemArray : [String]?
    var foodpriceArray : [String]?
    
    static let  sharedObject = Dbwraped()
    
    func getDatabasePath() -> String {
        let docDir = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let path = docDir.first!
        return path + "/myDatabase.sqlite"
    }
    func executeQuery(query: String) -> Bool
    {
        var success = false
        let dbpath = getDatabasePath()
        if(sqlite3_open(dbpath, &db) == SQLITE_OK)
        {
            if(sqlite3_prepare(db, query, -1, &stmt, nil) == SQLITE_OK)
            {
                if(sqlite3_step(stmt) == SQLITE_DONE)
                {
                success = true
                sqlite3_finalize(stmt!)
                sqlite3_close(db!)
                }
                else
                {
                print("Error in executing statement\(sqlite3_errmsg(db!))")
                }
            }
            else
            {
                print("Error in preparing\(sqlite3_errmsg(db!))")
            }
        }
        else
        {
            print("Error in openingdatabase\(sqlite3_errmsg(db!))")
        }
    return success
    }
    func selectAlltask(query: String)
    {
        fooditemArray = [String]()
        foodpriceArray = [String]()
        let dbpath = getDatabasePath()
        if(sqlite3_open(dbpath, &db) == SQLITE_OK)
        {
            if(sqlite3_prepare_v2(db, query, -1, &stmt, nil) == SQLITE_OK)
            {
                while(sqlite3_step(stmt) == SQLITE_ROW)
                {
                    let taskIdInC = sqlite3_column_text(stmt, 0)
                    let taskNameInC = sqlite3_column_text(stmt, 1)
                    let taskName = String(cString: taskNameInC!)
                    var taskId1 = String(cString: taskIdInC!)
                    fooditemArray!.append(taskName)
                    foodpriceArray!.append(taskId1)
                }
                // print(taskNameArray)
                //print(taskIdArray)
                sqlite3_close(db!)
            }
            else
            {
                print("error in preparing statement\(sqlite3_errmsg(db!))")
            }
        }
        else
        {
            print("error in opening database\(sqlite3_errmsg(db!))")
        }
    }
    
    func createtable()
    {
        let createQuery = "create table if not exists menutable(fooditem text, foodprice text)"
        let isSuccess = executeQuery(query: createQuery)
        if isSuccess
        {
            print("creation: completed")
        }
        else
        {
            print("creation: Failed")
        }
    }
}
