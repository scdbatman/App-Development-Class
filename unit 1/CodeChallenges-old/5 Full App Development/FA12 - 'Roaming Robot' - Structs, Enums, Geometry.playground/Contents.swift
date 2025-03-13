//  🏔️ MTECH Code Challenge SD12: "Roaming Robot" 🤖
//  Concept: Practice conceptualizing geometric algorithms in terms of numbers; practice using structs

//  Instructions:
    //  A robot roams around a 2D grid. It starts at (0, 0) facing North. After each time it moves, the robot rotates 90 degrees clockwise. Given the amount the robot has moved each time, you have to calculate the robot's final position.
    //  Your function should take in an array of ints (movements) and return a Point (Final position). A Point will be a custom struct that you make that has an x property and a y property
    //  To illustrate, if the robot is given the movements 20, 30, 10, 40 then it will move:
        //  20 steps North, now at (0, 20)
        //  30 steps East, now at (30, 20)
        //  10 steps South. now at (30, 10)
        //  40 steps West, now at (-10, 10)
        //  ...and will end up at coordinates (-10, 10).

//  ⌺ Black Diamond Challenge:
    //  Print a grid made out of 8 ⬜️ square emojis and 🤖 one robot emoji. With Point(x:0, y:0) representing the center of the grid, make the robot print in the correct position in the grid.

import Foundation
