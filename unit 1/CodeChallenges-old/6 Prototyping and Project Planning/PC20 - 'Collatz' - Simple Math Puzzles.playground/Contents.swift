//  🏔️ MTECH Code Challenge PC20: "Collatz Conjecture"
//  Concept: Practice using simple math iteratively to achieve complex calculations

//  Instructions:
    //  The Collatz conjecture is a famous unsolved mathematical problem. It posits that repeating two simple arithmetic rules will eventually transform every positive integer into one.
    //  You can generate a Collatz sequence by applying the following simple rules to an integer, and repeating for each resulting integer.
        //  If even: divide by 2.
        //  If odd: multiply by 3, then add 1.
    //  The Collatz algorithm has been tested and found to always reach 1 for all positive integers (but no general proof has been found).

    //  Create a recursive function that accepts a parameter as input. For output, print out the Collatz sequence of the given integer.

//  Examples:
    //  Input: collatz(10)
    //  Output (in console):
    //  1: 10
    //  2: 5
    //  3: 16
    //  4: 8
    //  5: 4
    //  6: 2
    //  7: 1

//  ⌺ Black Diamond Challenge:
    //  Create a function that, when given two positive integers a & b, returns the string "a" if integer 'a' took fewer steps to reach 1 than b when passed through the Collatz sequence, or "b" if integer 'b' took fewer steps to reach 1 than a.

import Foundation
