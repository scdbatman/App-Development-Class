//  🏔️ MTECH Code Challenge ST12: "Card View"
//  Concept: Practice creating ViewModifiers to create custom reusable view designs.

//  Instructions:
    //  The company you work for is building a mindfullness app. They want to use a particular view design to display around important information.
    //  Your boss is not good with Figma, so he simply describes to you that he wants a reusable "card" view that can be added to any text or image.
        //  He specifies that the card should have parameters that allow you to set the background color and padding.
        //  He says he wants the view to have a gradient and an inner shadow, and text to be Futura font.
    //  You have already prototyped out the view in the code below. Create a ViewModifier that applies the font, padding, and background modifiers below to any view.
    //  Make sure you add the requested parameters.

//  Notes: 
    //  Not sure how to create a custom ViewModifier? Paul Hudson has the answer: https://www.hackingwithswift.com/books/ios-swiftui/custom-modifiers

//  ⌺ Black Diamond Challenge:
    //  Make your view modifier more convenient to use by extending View with a function that applies your modifier.

import SwiftUI
import PlaygroundSupport

struct ContentView: View {
    var body: some View {
        Text("You are a good person")
        //  FIXME: Move these view modifiers to a single ViewModifier
            .font(.custom("Futura", size: 20))
            .padding(20)
            .background {
                RoundedRectangle(cornerSize: CGSize(width: 10, height: 10))
                    .foregroundStyle(.cyan.gradient.shadow(.inner(radius: 3)))
            }
        
    }
}

PlaygroundPage.current.setLiveView(ContentView())

