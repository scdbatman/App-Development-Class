/*:
## Exercise - Class Memberwise Initializers and References

 - Note: The exercises below are based on a game where a spaceship avoids obstacles in space. The ship is positioned at the bottom of a coordinate system and can only move left and right while obstacles "fall" from top to bottom. The base class `Spaceship` and subclasses `Fighter` and `ShieldedShip` have been provided for you below. You will use these to complete the exercises.
 */
class Spaceship{
    var name: String
    var health: Int
    var position: Int
    var shieldStrength: Int
    
    init(_ name: String, health: Int, position: Int, shieldStrength: Int){
        self.name = name
        self.health = health
        self.position = position
        self.shieldStrength = shieldStrength
    }
    
    func moveLeft(){
        position -= 1
        print("\(name) position: \(position)")
    }
    func moveRight(){
        position += 1
        print("\(name) position: \(position)")
    }
    func wasHit(){
        if(shieldStrength > 0){
            shieldStrength -= 5
            print("\(name) was hit! \(name) shield strength: \(shieldStrength)")
            print("\(name) was hit! \(name) health: \(health)")
        }else{
            health -= 5
            print("\(name) was hit! \(name) health: \(health)")
            if(health <= 0){
                print("You Died :(")
            }//end of if
        }// end of if else
    }//end of func wasHit
    
}//end of spaceship class
class Fighter: Spaceship{
    var weapon: String = ""
    var remainingFirePower: Int = 5
    
    init(_ name: String, health: Int, position: Int, shieldStrength: Int, weapon: String, remainingFirePower: Int){
        self.weapon = weapon
        self.remainingFirePower = remainingFirePower
        
        super.init(name, health: health, position: position, shieldStrength: shieldStrength)
    }//end of init
    func fire(){
        if(remainingFirePower > 0){
            remainingFirePower -= 1
            print("\(name) has \(remainingFirePower) bullets left")
        }else{
            print("\(name) has no more ammo :(")
        }//end of if else
        
    }//end of fire func
    
    
}//end of fighter class




/*:
 Note that each class above has an error by the class declaration that says "Class has no initializers." Unlike structs, classes do not come with memberwise initializers because the standard memberwise initializers don't always play nicely with inheritance. You can get rid of the error by providing default values for everything, but it is common, and better practice, to simply write your own initializer. Go to the declaration of `Spaceship` and add an initializer that takes in an argument for each property on `Spaceship` and sets the properties accordingly.

 Then create an instance of `Spaceship` below called `falcon`. Use the memberwise initializer you just created. The ship's name should be "Falcon."
 */
var falcon = Spaceship.init("falcon", health: 0, position: 0, shieldStrength: 0);


/*:
 Writing initializers for subclasses can get tricky. Your initializer needs to not only set the properties declared on the subclass, but also set all of the uninitialized properties on classes that it inherits from. Go to the declaration of `Fighter` and write an initializer that takes an argument for each property on `Fighter` and for each property on `Spaceship`. Set the properties accordingly. (Hint: you can call through to a superclass's initializer with `super.init` *after* you initialize all of the properties on the subclass).

 Then create an instance of `Fighter` below called `destroyer`. Use the memberwise initializer you just created. The ship's name should be "Destroyer."
 */
let destroyer = Fighter.init("Destroyer", health: 10, position: 2, shieldStrength: 0, weapon: "laser", remainingFirePower: 15)


/*:
 Now go add an initializer to `ShieldedShip` that takes an argument for each property on `ShieldedShip`, `Fighter`, and `Spaceship`, and sets the properties accordingly. Remember that you can call through to the initializer on `Fighter` using `super.init`.

 Then create an instance of `ShieldedShip` below called `defender`. Use the memberwise initializer you just created. The ship's name should be "Defender."
 */
let shieldedShip = Fighter.init("Defender", health: 10, position: 10, shieldStrength: 25, weapon: "Cannon", remainingFirePower: 5)


//:  Create a new constant named `sameShip` and set it equal to `falcon`. Print out the position of `sameShip` and `falcon`, then call `moveLeft()` on `sameShip` and print out the position of `sameShip` and `falcon` again. Did both positions change? Why? If both were structs instead of classes, would it be the same? Why or why not? Provide your answer in a comment or print statement below.
var sameShip = falcon

sameShip.moveLeft()
falcon.moveLeft()
print("Both of the values changed because they are taking from the same class. This would not happen if a struct was used because a struct would create a copy and not affect the parent element.")

/*:
 _Copyright © 2023 Apple Inc._

 _Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:_

 _The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software._

 _THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE._
 
[Previous](@previous)  |  page 4 of 4
 */
