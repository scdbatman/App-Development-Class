//  🏔️ MTECH Code Challenge PC22: "Simple Cipher"
//  Concept: Create a (weak) cryptographic cipher.

//  Instructions:
    //  In cryptography, a cipher (or cypher) is a means of encrypting (or decrypting) a piece of text or information. One famous example is the book cipher, in which a page, paragraph, and word number corresponds to a particular word in a specific book. This makes it so only someone who knows the book can decode the page, paragraph, and word number's meaning.

    //  In our simple cipher, only alphabetical characters will be encoded with the following rules:
        //  The first alphabetical character will not change (except for switching to upper case).
        //  All following characters will be shifted toward "Z" by the alphabetical position of the first alpha character (wrap back to "A" if "Z" is passed).
            //  (For example, J is the 10th letter of the alphabet. If we have "w" for our next letter, we shift 10 positions, passing Z back to and arriving at G as the letter 10 positions away from W.)

//  Notes:
    //  Convert all input characters to uppercase.
    //  Remember that A will appear at index 0 in an array but should be considered position 1.

// Examples
    //  Input: "hello"
    //  Logic:
    //  first -> "h" -> "H" since first character is to be unchanged (except to become an uppercased letter)
    //  second -> "e" -> "M". H is the previous character and 8th letter in the alphabet. E shifted by 8 spaces becomes M.
    //  Repeating this process we wind up with:
    //  Output: "HMQXA"

//  ⌺ Black Diamond Challenge:
    //  Create another function that decodes our cipher back to the input string (ignoring case).

import Foundation

