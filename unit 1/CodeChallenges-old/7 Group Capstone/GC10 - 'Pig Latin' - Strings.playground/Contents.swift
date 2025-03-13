//  🏔️ MTECH Code Challenge GC10: "Pig Latin" 🐷🔤
//  Concept: Practice evaluating strings and dynamically manipulating them

//  Instructions:
    //  Create a function take that takes a string and returns another.
    //  The output string should be the Pig Latin version of the input stream. (You can assume the input will be valid English language input.)
    //  To turn English into Pig Latin, you should:
        //  Move the first letter of each word to the end of the word, unless the first letter is a vowel.
        //  Add "ay" to the end of the word.
        //  Words starting with a vowel (A, E, I, O, U) should just have "ay" appended, without moving the first letter.

//  Examples:
    //  Input: "This is a really great code challenge and I hope you love it"
    //  Output: "Isthay isway away eallyray reatgay odecay hallengecay andway Iway opehay ouyay ovelay itay"

//  Notes:
    //  Be sure to preserve the input's proper capitalization and punctuation.

//  ⌺ Black Diamond Challenge:
    //  In true Pig Latin, the first consonant sound is moved to the end, not just the first letter. Identify combined consonant sounds like "th," "ch," "tr," and so on, and move them appropriately.
    //  Input: "challenge", output: "allengechay"

import Foundation
