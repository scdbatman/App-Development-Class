//
//  FoodTableViewController.swift
//  Meal Tracker
//
//  Created by Samuel Bradshaw  on 3/7/25.
//

import UIKit

class FoodTableViewController: UITableViewController {

    let meals: [Meal] = [
        Meal(name: "breakfast", food: [
            Food(name: "Eggs", description: "came from a chicken"),
            Food(name: "Bacon", description: "cwispy"),
            Food(name: "toast", description: "better than sliced bread"),
            ]),
        Meal(name: "lunch", food: [
            Food(name: "pizza", description: "best with ranch"),
            Food(name: "apple", description: "keeps the doctor away"),
            Food(name: "soda", description: "mmmm chemicals"),
            ]),
        Meal(name: "dinner", food: [
            Food(name: "Chicken sandwich", description: "also came from a chicken"),
            Food(name: "salad", description: "gotta be healthy"),
            Food(name: "cake", description: "everyday is my birthday"),
            ]),
        ]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
            // #warning Incomplete implementation, return the number of sections
        print(meals.count)
        return meals.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        print(meals[section].food.count)
        return meals[section].food.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Food", for: indexPath)
        
        let mealSection = meals[indexPath.section]
        let mealRow = mealSection.food[indexPath.row]
        
        var configuration = cell.defaultContentConfiguration()
        
        configuration.text = mealRow.name
        configuration.secondaryText = mealRow.description
                
        cell.contentConfiguration = configuration
        
        // Configure the cell...

        return cell
    }
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return meals[section].name
    }
    
}
