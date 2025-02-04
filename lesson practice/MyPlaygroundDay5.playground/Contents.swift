import UIKit

var greeting = "Hello, playground"


class Building{
    var address: String
    var rooms: Int
    
    init(address: String, rooms: Int){
        self.address = address
        self.rooms = rooms
    }//end of init
}// end of building

class House: Building{
    
    var hasAttatchedGarage: Bool;
    var cars: Int
    
    init(_ address: String, rooms: Int, hasAttatchedGarage: Bool = true){
        self.hasAttatchedGarage = hasAttatchedGarage
        
        if(hasAttatchedGarage){
            cars = 2
        }else{
            cars = 0
        }
        
        super.init(address: address, rooms: rooms)
    }//end of init
    
    init() {
        hasAttatchedGarage = false
        cars = 0
        
        super.init(address: "", rooms: 0)
    }//end of init
    
    func demolish(){
        rooms = 0
        hasAttatchedGarage = false;
        cars = 0;
    }
    
}//end of struct
class DogHouse: House{
    init(address: String){
        super.init(address, rooms: 1, hasAttatchedGarage: false)
    }//end of init
}//end of doghouse

class Office: Building{
    var businessName: String
    var parkingSpaces: Int
    
    init(address: String, rooms: Int, businessName: String, parkingSpaces: Int){
        self.businessName = businessName
        self.parkingSpaces = parkingSpaces
        super.init(address: address, rooms: rooms)
    }//end of init
}//end of office

let myHouse = House("4123 Pinebrook way", rooms: 4);
let myFriendsHouse = House("4156 Pinebrook way", rooms: 3);
let myDogHouse = House("4123 Pinebrook way", rooms: 1, hasAttatchedGarage: false)

var unfinishedHouse = House.init()
var newHouse = unfinishedHouse

unfinishedHouse.rooms = 1;
var dogHouse = DogHouse.init(address: "blah")

//let totalRooms = myHouse.rooms + myFriendsHouse.rooms + myDogHouse.rooms;

print(myHouse.rooms)

