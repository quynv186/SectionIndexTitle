//
//  TableViewController.swift
//  SectionIndex
//
//  Created by QUYNV on 11/13/16.
//  Copyright © 2016 QUYNV. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    var arrData : NSMutableArray!
    var dictContacts = NSMutableDictionary()
    var arrKey : [String]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        self.tableView.sectionIndexBackgroundColor = UIColor.gray
        
        self.tableView.sectionIndexColor = UIColor.white
        
        arrData = NSMutableArray()
        for _ in 0...60 {
            arrData.add(Person())
            
        }
        
        for element in arrData {
            let person = element as! Person
            var firstLetter : String = (person.firstName as NSString!).substring(to: 1)
            
            if firstLetter == "Đ" {
                firstLetter = "D"
            }
            if firstLetter == "Á" {
                firstLetter = "A"
            }
            
            var arrForLetter : NSMutableArray!
            
            if (dictContacts.value(forKey: firstLetter)) != nil {
                arrForLetter = dictContacts.value(forKey: firstLetter) as! NSMutableArray
                arrForLetter.add(person)
                dictContacts.setValue(arrForLetter, forKey: firstLetter)
            } else {
                arrForLetter = NSMutableArray(object: person)
                dictContacts.setValue(arrForLetter, forKey: firstLetter)
            }
        }
        arrKey = dictContacts.allKeys as! [String]
        arrKey = arrKey.sorted()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return arrKey.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        let sectionTitle = arrKey[section]
        let sectionPersons = dictContacts.object(forKey: sectionTitle) as! NSArray
        
        return (sectionPersons).count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return arrKey[section] 
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "Cell")

        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "Cell")
        }
        
        let sectionTitle = arrKey[indexPath.section]
        let sectionPersons = dictContacts.object(forKey: sectionTitle) as! NSArray
        
        let person = sectionPersons[indexPath.row] as! Person
        
        cell?.textLabel?.text = person.fullName
        cell!.detailTextLabel?.text = person.telephone
        
        return cell!
    }
    
    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return arrKey as [String]
    }
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.tintColor = UIColor.gray
        let header : UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
        header.textLabel?.textColor = UIColor.white
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = DetailVC()
        
        let sectionTitle = arrKey[indexPath.section]
        let sectionPersons = dictContacts.object(forKey: sectionTitle) as! NSArray
        let person = sectionPersons[indexPath.row] as! Person
        
        detailVC.person = person
        self.navigationController?.pushViewController(detailVC, animated: true)
        
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
