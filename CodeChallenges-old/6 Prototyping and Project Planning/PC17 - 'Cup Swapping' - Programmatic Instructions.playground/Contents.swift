//  🏔️ MTECH Code Challenge PC17: "Cup Swapping"
//  Concept: Practice processing an input as a set of instructions and manipulate data in response

//  Instructions:
    //  There are three cups on a table, at positions A, B, and C. At the start, there is a ball hidden under the cup at position B.
    //  However, I perform several swaps on the cups, which is notated as two letters. For example, if I swap the cups at positions A and B, I could notate this as AB or BA.
    //  Create a function that returns the letter position that the ball is at, once I finish swapping the cups. The swaps will be given to you as an array.

//  Examples:
    //  Input: cupSwapping(["AB", "CA", "AB"])
    //  Logic:
        //  Ball begins at position B.
        //  Cups A and B swap, so the ball is at position A.
        //  Cups C and A swap, so the ball is at position C.
        //  Cups A and B swap, but the ball is at position C, so it doesn't move.
    //  Output: "C"

    //  Input: cupSwapping(["AB", "CA"]), Output: "C"
    //  Input: cupSwapping(["AC", "CA", "CA", "AC"]), Output: "B"
    //  Input: cupSwapping(["BA", "AC", "CA", "BC"]), Output: "A"

//  Notes:
    //  A swap could be notated in two different ways, since both ways end up with the same outcome.
    //  All swaps will be notated as capital letters and will be valid.
    //  You cannot swap a cup with itself.

//  ⌺ Black Diamond Challenge:
    //  In addition to determining the final position of the ball, extend the function to also return the final positions of all three cups (A, B, and C) after the swaps.

import Foundation
