//  🏔️ MTECH Code Challenge PC19: "Ice Cream Sandwich Police" 🍦🥪🚨
//  Concept: Take an abstract data evaluation requirement and figure out how to apply it to a string

//  Instructions:
    //  An ice cream sandwich is a string that is formed by two identical ends and a different middle.
    //  You hate ice cream sandwich strings and have declared yourself the ice cream sandwich police.
    //  Write a function that returns true if a string is an ice cream sandwich and false otherwise so you can find and destroy those awful, awful strings.

    //  Some examples of ice cream sandwiches:
        //  "AABBBAA"
        //  "3&&3"
        //  "yyyyymmmmmmmmyyyyy"
        //  "hhhhhhhhmhhhhhhhh"
    //  Notice how left and right ends of the sandwich are identical in both length and in repeating character. The middle section is distinctly different.

    //  Not ice cream sandwiches:
        //  "BBBBB"
            //  You can't have just plain ice cream.
    
        //  "AAACCCAA"
            // You can't have unequal sandwich ends.

        //  "AACDCAA"
            //  You can't have more than one filling.

        // "A"
            //  You can't have fewer than 3 characters.

//  Examples:
    //  Input: isIcecreamSandwich("CDC"), Output: true
    //  Input: isIcecreamSandwich("AAABB"), Output: false
    //  Input: isIcecreamSandwich("AA"), Output: false

//  Notes:
    //  An ice cream sandwich must have a minimum length of 3 characters, and at least two of these characters must be distinct (you can't only have the filling!).

//  ⌺ Black Diamond Challenge:
    //  Expand your function so it can properly identify ice cream sandwiches with more layers. For example, "AACDCAA" would now return true, since "CDC" is a sandwich and "AA AA" is another layer around it.

import Foundation
