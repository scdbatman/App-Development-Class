//
//  RecipeListTableViewController.swift
//  RecipeApp - UITableView Practice
//
//  Created by Brad Forsyth on 3/11/25.
//

import UIKit

class RecipeListTableViewController: UITableViewController {
    
    var recipes: [Recipe] = [
        Recipe(title: "Pizza", ingredients: ["Cheese, Sauce, Pizza Dough"]),
        Recipe(title: "Tacos", ingredients: ["Beef, Tortilla, Tomatoes, Onions"]),
        Recipe(title: "Cake", ingredients: ["Flour, sugar, eggs, butter"])
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
//    @IBSegueAction func displayDetails(_ coder: NSCoder) -> RecipeViewController? {
//        return RecipeViewController(recipe: <#T##Recipe#>, coder: coder)
//    }
    @IBSegueAction func displayDetails(_ coder: NSCoder, sender: Any?) -> RecipeViewController? {
        guard let cell = sender as? UITableViewCell, let indexPath = self.tableView.indexPath(for: cell) else { return nil }
        
        let recipe = recipes[indexPath.row]
        
        return RecipeViewController(recipe: recipe, coder: coder)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipes.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "recipeCell", for: indexPath)

        let recipe = recipes[indexPath.row]
        
        var config = cell.defaultContentConfiguration()
        config.text = recipe.title
        config.secondaryText = recipe.formattedIngredients()
        
        cell.contentConfiguration = config

        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            recipes.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }  
    }

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
