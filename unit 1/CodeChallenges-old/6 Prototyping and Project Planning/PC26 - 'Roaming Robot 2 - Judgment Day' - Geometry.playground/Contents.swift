//  🏔️ MTECH Code Challenge PC26: "Roaming Robot 2: Judgment Day" 🤖2️⃣
//  Concept: Practice representing 2D space in code

//  Instructions:
    //  A robot moves around a 2D grid. At the start, it is at x: 0, y: 0, facing east. It is controlled by a sequence of instructions:
        //  . means take one step forwards in the current direction.
        //  < means turn 90 degrees anticlockwise.
        //  > means turn 90 degrees clockwise.
    //  Your job is to process the instructions and return the final position of the robot as a Point.
    //  Your Point struct should have an x and a y property.

//  Examples:
    //  Input: "..<.<."
    //  Logic:
        //  Step 1: . It still faces east, and is at x: 1, y: 0
        //  Step 2: . It still faces east, and is at x: 2, y: 0
        //  Step 3: < It now faces north, and is still at x: 2, y: 0
        //  Step 4: . It still faces north, and is at x: 2, y: 1
        //  Step 5: < It now faces west, and is still at x: 2, y: 1
        //  Step 6: . It still faces west, and is now at x: 1, y: 1
    //  Output: point(x: 1, y: 1)

//  Notes:
    //  The instruction strings will only contain the three valid characters ., < or >.
    //  You will always be passed a string (but the string might be empty).

//  ⌺ Black Diamond Challenge:
    //  Print a grid made out of ⬜️ square emojis and one ⬆️ arrow emoji representing the robot, with the arrow facing the direction the robot faces. After each instruction is processed, make the robot print in the correct position and orientation in the grid. The size of the grid will need to be calculated based on the input instructions to accommodate all the places the robot will go for that given set of instructions.

import Foundation
