//  🏔️ MTECH Code Challenge ST10: "Tally App"
//  Concept: Practice modifying SwiftUI views to display information based on State with unique requirements

//  Instructions:
    //  You are creating a very simple tally app for kids to practice counting.
    //  Your challenge is to create a SwiftUI view that changes each time the screen is tapped.
    //  Your screen should start with a single red rectangle in the top left corner of the view.
    //  Each time the rectangle is tapped, add another rectangle to the row.
    //  Once a row has five rectangle, move down to the next row and start filling it.

//  Notes:

    //  Part of the code has been started for you. Fill in the rest.
    //  If you cannot see the preview, make sure Live View is enabled (Press Option + Command + Enter or, in the menu, click Editor -> Live View). Make sure "PlaygroundPage.current.setLiveView(ContentView())" is at the bottom of your code as well.

//  Examples:
    //  Starting state:
        //  🟥
    //  tap 6 times
    //  Ending state:
        //  🟥🟥🟥🟥🟥
        //  🟥🟥

//  ⌺ Black Diamond Challenge:
    //  Look up what a LazyHGrid and LazyVGrid are. Change the implementation below to use one of those two options instead.

import SwiftUI
import PlaygroundSupport

struct ContentView: View {
    @State var squaresFilled = 1
    
    var body: some View {
        VStack {
            ForEach(0..<10) { row in
                HStack {
                    ForEach(0..<5) { column in
                        // FIXME: Add code below to display red rectangles
                    }
                }
            }
        }
        .onTapGesture {
            squaresFilled += 1
            print(squaresFilled)
        }
    }
}

PlaygroundPage.current.setLiveView(ContentView())

