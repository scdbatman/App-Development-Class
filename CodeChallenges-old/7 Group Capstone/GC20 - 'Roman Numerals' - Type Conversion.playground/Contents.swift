//  🏔️ MTECH Code Challenge GC20: "Roman Numerals"
//  Concept: Practice converting unique numerical values to another format, similar to how conversion of the same data between types takes place.

//  Instructions:
    //  Create a function that takes in a Roman numeral as a string and converts it to an integer, returning the result. The function should work for all Roman numerals representing positive integers less than 4000.

    //  The following table shows how digits will be represented in Roman numeral notation:
/*
Place value 1   2   3   4   5   6   7   8   9
Ones        I  II  III  IV  V  VI  VII VIII IX
Tens        X  XX  XXX  XL  L  LX  LXX LXXX XC
Hundreds    C  CC  CCC  CD  D  DC  DCC DCCC CM
Thousands   M  MM  MMM  -   -   -   -   -   -
*/

//  Examples:
    //  Input: "VII"
    //  Output: 7

    //  Input: "DCLXXIX"
    //  Output: 679

    //  Input: "MMMCMV"
    //  Output: 3905

//  Notes:
    //  All letters will be in uppercase.
    //  Assume all inputs will be well-formed Roman numerals.
    //  While you could probably solve this by separately checking for each of these sequences inside the string, there is a smarter way. Think about the numerical value each individual letter has, and how the letter immmediately following it can affect that letter's numerical value.

//  ⌺ Black Diamond Challenge:
    //  Extend your code to also include a function that converts an integer to a Roman numeral. The function should take an integer as input and return a string representing the Roman numeral equivalent.

import Foundation
