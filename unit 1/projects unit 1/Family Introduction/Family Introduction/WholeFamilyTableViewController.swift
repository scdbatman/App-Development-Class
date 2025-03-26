//
//  WholeFamilyTableViewController.swift
//  Family Introduction
//
//  Created by Samuel Bradshaw  on 3/26/25.
//

import UIKit

class WholeFamilyTableViewController: UITableViewController {

    let dad = FamilyMember(name: "Dan", age: "51", hobbies: "piano, puzzles", personality: "easy going", job: "Music Theory Proffesor", birthday: "September 26 ", rating: "8/10", pictures: ["Dad1", "Dad2", "Dad3"])
    let mom = FamilyMember(name: "Emily", age: "48", hobbies: "singing, running", personality: "Determined", job: "Instructional Designer", birthday: "March 25", rating: "9/10", pictures: ["Mom1", "Mom2", "Mom3"])
    
    let jane = FamilyMember(name: "Jane", age: "23", hobbies: "singing, rock climbing", personality: "goofy", job: "language teacher", birthday: "September 21 ", rating: "6/10", pictures: ["Jane1", "Jane2", "Jane3"])
    let colin = FamilyMember(name: "Colin", age: "18", hobbies: "guitar, soccer", personality: "laid back", job: "Missionary", birthday: "December 6 ", rating: "7/10", pictures: ["Colin1", "Colin2", "Colin3"])
    let charlie = FamilyMember(name: "Charlie", age: "16", hobbies: "fortnite, body boarding", personality: "passionate", job: "line cook", birthday: "April 19 ", rating: "7/10", pictures: ["Charles1", "Charles2", "Charles3"])
    let quinn = FamilyMember(name: "Quinn", age: "10", hobbies: "BTD, plants and bugs", personality: "wonderful", job: "child", birthday: "August 14", rating: "10/10", pictures: ["Quinn1", "Quinn2", "Quinn3"])

    var family: [FamilyMember] = []
    required init?(coder: NSCoder) {
        family = [dad,mom,jane,colin,charlie,quinn]
        super.init(coder: coder)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return family.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "familyMemberCell", for: indexPath) as! wholeFamilyTableViewCustomCell
        
        cell.assignFamilyMember(family: family[indexPath.row])
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let familyMember = family[indexPath.row]
        let id = "familySpecifics"
        
        performSegue(withIdentifier: id, sender: familyMember)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // STEP 3
        guard let selectedFamilyMember = sender as? FamilyMember else { fatalError() }

        if let familySpecificsVC = segue.destination as? FamilySpecifics {
            familySpecificsVC.familyMember = selectedFamilyMember
        }
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
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
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
