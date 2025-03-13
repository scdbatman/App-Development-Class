//  🏔️ MTECH Code Challenge PC22: "Sailboat Height" 🌊⛵️
//  Concept: Tackle translating unique math into Swift code; practice wave mathematics.

//  Instructions:
    //  You are working on a simulation that calculates the movement of a sailboat on waves. (Your simulation is in 2D.) Right now, you are simulating standard sine waves.
    //  The top of the mast reaches 20 meters above the waterline of the boat, but moves up and down relative to sea level as the boat moves across the waves.

    //  You have been given a function with several inputs:
        //  x: Double
        //  amplitude: Double
        //  frequency: Double
        //  phaseShift: Double

    //  Given these variables, return the height of the top of the mast, relative to sea level (0m), at any given position (x) on the sine wave.

//  Notes:
    //  Assume all units are in meters.
    //  The trick to this challenge is understanding and implementing the math required. The formula itself is not terribly complex, but will require you to learn/relearn the math of sine waves.

//  Examples:
    //  Input: x: Double.pi, amplitude: 1, frequency: 1, phaseShift: 0
    //  Output: 20

//  ◇ Black Diamond Challenge:
    //  Your simulation now needs to take into account the tide.
    //  Add a time of day input to your function. Assume that low tide falls exactly at 0:00:00 and 12:25:00, and high tide occurs exactly at 6:12:30 and 18:37:30.
    //  Halfway between high and low tide the sea level is 0. At high tide, it's +5 meters, and at low tide, it's -5.
    //  Add/subtract the height caused by the tide at the given time of day to your final returned height.

import Foundation

func sailboatHeight(x: Double, amplitude: Double, frequency: Double, phaseShift: Double) -> Double {
    return 0.0
}
