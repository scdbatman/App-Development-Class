/*:
## Exercise - Override Methods and Properties

 - Note: The exercises below are based on a game where a spaceship avoids obstacles in space. The ship is positioned at the bottom of a coordinate system and can only move left and right while obstacles "fall" from top to bottom. Throughout the exercises, you'll create classes to represent different types of spaceships that can be used in the game. The base class `Spaceship` and one subclass `Fighter` have been provided for you below.
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

//:  Define a new class `ShieldedShip` that inherits from `Fighter`. Add a variable property `shieldStrength` that defaults to 25. Create a new instance of `ShieldedShip` called `defender`. Set `name` to "Defender" and `weapon` to "Cannon." Call `moveRight()` and print `position`, then call `fire()` and print `remainingFirePower`.
class ShieldedShip: Fighter{
    
}//end of shield class

let shieldedShip = ShieldedShip.init("Defender", health: 10, position: 10, shieldStrength: 25, weapon: "Cannon", remainingFirePower: 5)

shieldedShip.moveRight()
shieldedShip.fire()
//:  Go back to your declaration of `ShieldedShip` and override `wasHit()`. In the body of the method, check to see if `shieldStrength` is greater than 0. If it is, decrement `shieldStrength` by 5. Otherwise, decrement `health` by 5. Call `wasHit()` on `defender` and print `shieldStrength` and `health`.
shieldedShip.wasHit()

//:  When `shieldStrength` is 0, all `wasHit()` does is decrement `health` by 5. That's exactly what the implementation of `wasHit()` on `Spaceship` does! Instead of rewriting that, you can call through to the superclass implementation of `wasHit()`. Go back to your implementation of `wasHit()` on `ShieldedShip` and remove the code where you decrement `health` by 5 and replace it with a call to the superclass's implementation of the method. Call `wasHit()` on `defender`, then print `shieldStrength` and `health`.
shieldedShip.wasHit()

/*:
[Previous](@previous)  |  page 3 of 4  |  [Next: Exercise - Class Memberwise Initializers and References](@next)
 */
