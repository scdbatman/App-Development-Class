import UIKit

var greeting = "Hello, playground"

//create an optional
class FoodTypes{
    let vegetable: String?
    let fruit: String?
    let protien: String?
    // create a failable initializer
    
    init?(vegetable: String, fruit: String?, protien: String) {
        
        if let fruit = fruit{
            self.vegetable = vegetable
            self.fruit = fruit
            self.protien = protien
        }else{
            return nil
        }//end of if else
        
    }// end of init
}//end of class

//unwrap an optional using if let
var myFood = FoodTypes(vegetable: "Carrot", fruit:"apple", protien: "Beef")

if let food = myFood?.fruit{
    print(food)
}

//forcing objects to unwrap. can lead to crashes
print(myFood!.vegetable!)
