//  🏔️ MTECH Code Challenge GC06: "Game Inventory" 🎮🎒
//  Concept: Practice dynamically managing a dataset with unique functionality requirements.

//  Instructions:
    //  You are creating a video game and working on the player's inventory. Some code is already complete.
    //  Your goal is to add functionality to the Inventory class that holds all the items a player possesses.
    //  Create functions that do the following:
        //  Check inventory: Prints a list of all items in the player's posession
        //  Gain an item: Add the item to the end of the player's inventory
        //  Discard an item: Remove the item from the array, or any quantity of a given item
        //  Use an item: Print a message stating the item was used. For items that are destroyed or lost after using them (such as food, potion, and keys), decrease the quantity owned by one. If the quantity reaches 0, discard the item.
        //  Rearrange items: Change the order of items in their inventory.

//  ⌺ Black Diamond Challenges:
    //  Refactor so that, instead of ItemType being an enum, each ItemType is a subclass of Item.
    //  Item quantities have limits based on item type. A player can hold up to: 2 weapons, 1 shield, 4 armor, unlimited food, 10 potions, 100 collectibles, and unlimited keys. (If a player tries to add more than their limit, throw an error.)
    //  Add a price property for each Item and a money property to your Inventory class. Add buy and sell functions, where buying an item adds it to their inventory and decreases their money, and do the opposite for sell.

import Foundation

class Inventory {
    var items: [Item] = initialItems
    
    // MARK: Add Inventory functionality here
}

enum ItemType {
    case weapon, shield, armor, food, potion, collectible, key
}

class Item {
    var name: String
    var quantity: Int
    var type: ItemType
    
    init(name: String, quantity: Int, type: ItemType) {
        self.name = name
        self.quantity = quantity
        self.type = type
    }
}

let initialItems: [Item] = [
    Item(name: "Sword", quantity: 1, type: .weapon),
    Item(name: "Shield", quantity: 1, type: .shield),
    Item(name: "Helmet", quantity: 1, type: .armor),
    Item(name: "Bread", quantity: 5, type: .food),
    Item(name: "Health Potion", quantity: 3, type: .potion),
    Item(name: "Magic Stone", quantity: 2, type: .collectible),
    Item(name: "Skeleton Key", quantity: 1, type: .key),
    Item(name: "Axe", quantity: 1, type: .weapon),
    Item(name: "Iron Armor", quantity: 1, type: .armor),
    Item(name: "Cheese", quantity: 4, type: .food),
    Item(name: "Mana Potion", quantity: 2, type: .potion),
    Item(name: "Ancient Coin", quantity: 10, type: .collectible),
    Item(name: "Dungeon Key", quantity: 1, type: .key),
    Item(name: "Bow", quantity: 1, type: .weapon),
    Item(name: "Gauntlets", quantity: 1, type: .armor),
    Item(name: "Apple", quantity: 7, type: .food),
    Item(name: "Strength Potion", quantity: 1, type: .potion),
    Item(name: "Rare Gem", quantity: 1, type: .collectible),
    Item(name: "Castle Key", quantity: 1, type: .key)
]
