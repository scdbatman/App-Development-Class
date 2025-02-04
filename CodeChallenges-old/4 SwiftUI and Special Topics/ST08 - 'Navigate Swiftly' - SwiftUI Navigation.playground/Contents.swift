//  🏔️ MTECH Code Challenge ST08: "Navigate Swiftly"
//  Concept: Practice navigating in SwiftUI

//  Instructions:
    //  Someone hooked this app up all wrong. Fix it so that the view navigation behaves in the correct order.

//  Notes:
    //  Run the playground to see a preview. If you cannot see the preview, make sure Live View is enabled (Press Option + Command + Enter or, in the menu, click Editor -> Live View). Make sure "PlaygroundPage.current.setLiveView(ContentView())" is at the bottom of your code as well.

//  ⌺ Black Diamond Challenge:
    //  Rework this app so that ContentView uses an enum with a list of possible views combined with a state variable and a switch statement in order to choose which view to display. This method will require removing the navigation stack and links entirely, and instead binding your new state variable in each subview.

import SwiftUI
import PlaygroundSupport

struct ContentView: View {
    var body: some View {
        NavigationStack {
            FinalView()
        }
    }
}

struct FinalView: View {
    var body: some View {
        Text("The final view.")
        
        NavigationLink("Click me!", destination: SecondaryView())
    }
}

struct ThirdView: View {
    var body: some View {
        Text("The third view. How do you get here?")
    }
}

struct StartingView: View {
    var body: some View {
        Text("This is the first view.")
        
        NavigationLink("No more views.") {
            fatalError()
        }
    }
}

struct SecondaryView: View {
    var body: some View {
        Text("The second view!")
        
        NavigationLink("Tap me!", destination: StartingView())
    }
}

PlaygroundPage.current.setLiveView(ContentView())

