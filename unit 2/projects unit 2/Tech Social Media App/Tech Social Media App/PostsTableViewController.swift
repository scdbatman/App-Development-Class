//
//  PostsTableViewController.swift
//  Tech Social Media App
//
//  Created by Samuel Bradshaw  on 4/1/25.
//

import UIKit

class PostsTableViewController: UITableViewController {
    
    let post1 = Post(title: "Club Penguin Is Sick", image: "sickClubPenguin.png", bodyText: "Oh man I love club penguin", date: "3/3/25", user: "SamPenguin", comments: "wow I love club penguin too!", follower: "janePenguin")
    let post2 = Post(title: "Club Penguin Is Sick", image: "sickClubPenguin.png", bodyText: "Oh man I love club penguin", date: "3/3/25", user: "SamPenguin", comments: "wow I love club penguin too!", follower: "janePenguin")
    let post3 = Post(title: "Club Penguin Is Sick", image: "sickClubPenguin.png", bodyText: "Oh man I love club penguin", date: "3/3/25", user: "SamPenguin", comments: "wow I love club penguin too!", follower: "janePenguin")
    let post4 = Post(title: "Club Penguin Is Sick", image: "sickClubPenguin.png", bodyText: "Oh man I love club penguin", date: "3/3/25", user: "SamPenguin", comments: "wow I love club penguin too!", follower: "janePenguin")
    let post5 = Post(title: "Club Penguin Is Sick", image: "sickClubPenguin.png", bodyText: "Oh man I love club penguin", date: "3/3/25", user: "SamPenguin", comments: "wow I love club penguin too!", follower: "janePenguin")
    let post6 = Post(title: "Club Penguin Is Sick", image: "sickClubPenguin.png", bodyText: "Oh man I love club penguin", date: "3/3/25", user: "SamPenguin", comments: "wow I love club penguin too!", follower: "janePenguin")
    let post7 = Post(title: "Club Penguin Is Sick", image: "sickClubPenguin.png", bodyText: "Oh man I love club penguin", date: "3/3/25", user: "SamPenguin", comments: "wow I love club penguin too!", follower: "janePenguin")
    let post8 = Post(title: "Club Penguin Is Sick", image: "sickClubPenguin.png", bodyText: "Oh man I love club penguin", date: "3/3/25", user: "SamPenguin", comments: "wow I love club penguin too!", follower: "janePenguin")
    let post9 = Post(title: "Club Penguin Is Sick", image: "sickClubPenguin.png", bodyText: "Oh man I love club penguin", date: "3/3/25", user: "SamPenguin", comments: "wow I love club penguin too!", follower: "janePenguin")
    let post10 = Post(title: "Club Penguin Is Sick", image: "sickClubPenguin.png", bodyText: "Oh man I love club penguin", date: "3/3/25", user: "SamPenguin", comments: "wow I love club penguin too!", follower: "janePenguin")
    
    var postCollection: [Post] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        postCollection = [post1, post2, post3, post4, post5]
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postCollection.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "postCell", for: indexPath) as! CustomPostTableViewCell
        cell.assignPostInformation(post: postCollection[indexPath.row])
        
        return cell
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
