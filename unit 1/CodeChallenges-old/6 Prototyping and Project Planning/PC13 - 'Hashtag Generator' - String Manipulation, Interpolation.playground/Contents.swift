//  🏔️ MTECH Code Challenge PC13: "Hashtag Generator"
//  Concept: Practice manipulating strings by changing capitalization, removing characters, and inserting character(s).

//  Instructions:
    //  Create a "hashtag generator" function that accepts and returns a string and adheres to the following rules:

    //  The output must start with a hashtag (#).
    //  Each word in the output must have its first letter capitalized.
    //  If the final result, a single string, is longer than 140 characters, the function should return nil.
    //  If either the input (str) or the result is an empty string, the function should return nil.

//  Examples:
    //  Input: generateHashtag("    Hello     World   ")
    //  Output: "#HelloWorld"
    
    //  Input: generateHashtag("")
    //  Output: nil (per instructions above)

    //  Input: generateHashtag("Coding is fun")
    //  Output: "#CodingIsFun" (removed spaces and capitalized)

//  Bonus Challenge:
    //  Create another function, "Evaluate hashtag", that accepts any given string that starts with a # and returns a score.
    //  Calculate the score based on the following:
        //  Length: Give higher scores for shorter hashtags, both in terms of characters and word count.
        //  Emojis: Give higher scores for users who use emojis.
        //  Punctuation: Give lower scores for hashtags with punctuation marks
    //  You may determine exactly how the score is weighted, calculated, and returned (i.e. a letter grade, individual scores for each criteria, etc.)

import Foundation
