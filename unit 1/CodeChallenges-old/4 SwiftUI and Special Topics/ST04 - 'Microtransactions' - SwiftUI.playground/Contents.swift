//  🏔️ MTECH Code Challenge ST04: "Microtransactions"
//  Concept: Practice using SwiftUI State variables to track values

//  Instructions:
    //  You are working on an app that has microtransactions.
    //  Players can gain several different currencies in the app. The page below is the store page.
    //  For this code challenge, you can pretend that pressing a button represents completing whatever transaction is required, whether it is a cash purchase or watching an ad. You don't have to worry about actually setting up this functionality.

    //  Currently, the buttons and displays are not wired to any actual data. Create State variables for each type of currency, make the displays show their current value, and make the buttons modify them appropriately.

//  Notes:
    //  Run the playground to see a preview. If you cannot see the preview, make sure Live View is enabled (Press Option + Command + Enter or, in the menu, click Editor -> Live View). Make sure "PlaygroundPage.current.setLiveView(ContentView())" is at the bottom of your code as well.

//  ⌺ Black Diamond Challenge:
    //  Improve the appearance of the app.
    //  Change the quantities of currencies, how currencies are exchanged, and add more buttons for trading between them.

import SwiftUI
import PlaygroundSupport

struct ContentView: View {
    var body: some View {
        VStack(spacing: 50) {
            HStack(spacing: 20) {
                Text("Number of 💎: 0")
                Text("Number of 💵: 0")
                Text("Number of ⭐️: 0")
            }
            .padding()
            .background {
                //  Text background is a rounded rectangle made of thin Material
                RoundedRectangle(cornerRadius: 10)
                    .fill(Material.thin)
            }
            .padding()
            
            Spacer()
            
            Button("Purchase 5 💎s") {
                //  Add logic here
            }
            
            Button("Exchange 1 💎 for 5 💵s") {
            //  Add logic here
            }
            
            Button("Watch a video to earn 5 ⭐️s") {
                //  Add logic here
            }
            
            Spacer()
            
        }
        .frame(width: 800, height: 500)
    }
}

PlaygroundPage.current.setLiveView(ContentView())

