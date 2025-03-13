//  🏔️ MTECH Code Challenge PC05: "Spot Check"
//  Concept: Practice evaluating the data in an array with a unique set of logical requirements

//  Instructions:
    //  All the numbers in your program decide to have a party at a local Array. As each number arrives, they look for where in the array they should hang out.
    //  Odd numbers like to hang out with odd numbers. Even numbers like to hang out with even numbers. They won't like a spot to hang out unless at least one of their neighbors is the same parity (odd/even) as them.
    //  A spot is any place you could insert a new value between two numbers in an array. (Given an array of n integers in length, there are n-1 spots available.)

    //  For instance:
    
    //  [3, 4, 9, 10, 1]
        //  This array of 5 digits can also be thought of as...
    //  [3, __ , 4, __ , 9, __, 10, __, 1]
        //  ...an array with 4 spots.

    //  Given an array and an integer, calculate how many spots in the array the integer would like.

//  Examples:
    //  Input: [0, 4, 6, 8], 9
    //  Logic: 9 likes NONE of the following spots: [0, __, 4], [4, __ , 6], [6, __, 8] because all of his neighbors are even.
    //  Output: 0

    //  Input: [0, 4, 6, 8], 12
    //  Logic: 12 likes ALL of the spots because he will have an even neighbor at any of them.
    //  Output: 3

    //  Input: [4, 4, 4, 4, 5], 7
    //  Logic: 7 dislikes every spot except the last one at: [4, __, 5].
    //  Output: 1

//  ⌺ Black Diamond Challenge:
    //  Create another function. This time, return the first and last n elements of the array. If the first and last n elements overlap (i.e., 3 first and 3 last in a 5 element array), return the whole array.

import Foundation
