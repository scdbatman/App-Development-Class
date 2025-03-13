//  🏔️ MTECH Code Challenge ST18: "CoreData Debug"
//  Concept: Practice tracking down the source of an error; review CoreData skills

//  Instructions:
    //  Something has gone wrong with your chicken database app, the app you use to track and sort your chickens.
    //  It was probably your intern, Parker. He's always messing things like this up.
    //  Track down and fix the bug(s).

//  Notes:
    //  Getting CoreData compatible apps to run in preview can be tricky. Use Simulator for this app.

//  ⌺ Black Diamond Challenge:
    //  Expand the functionality of the chicken tracker app as you see fit:
        //  Add new properties to chickens,
        //  Add sorting functionality to the list view,
        //  etc.

import SwiftUI
import CoreData

struct ContentView: View {
    @State var viewModel = ViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.chickens) { chicken in
                    NavigationLink {
                        VStack {
                            Image(systemName: "bird")
                                .resizable()
                                .scaledToFit()
                            Text("Chicken: \(chicken.name ?? "No Name")")
                        }
                        .padding()
                    } label: {
                        HStack {
                            Text(["🐔", "🐥", "🐓", "🐣","🐤"].randomElement()!)
                            Text(chicken.name ?? "Chicken")
                        }
                    }
                }
                .onDelete(perform: viewModel.deleteItems)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: viewModel.addChicken) {
                        Label("Add Chicken", systemImage: "plus")
                    }
                }
            }
            Text("Select a chicken")
        }
    }
}

extension ContentView {
    @Observable
    class ViewModel {
        @Environment(\.managedObjectContext) var viewContext
        
        @FetchRequest(
            sortDescriptors: [NSSortDescriptor(keyPath: \Chicken.name, ascending: true)],
            animation: .default)
        var chickens: FetchedResults<Chicken>

        func addChicken() {
            withAnimation {
                let newChicken = Chicken(context: viewContext)
                newChicken.name = ChickenNames.list.randomElement() ?? "Chicken"
                
                do {
                    try viewContext.save()
                } catch {
                    let nsError = error as NSError
                    fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
                }
            }
        }
        
        func deleteItems(offsets: IndexSet) {
            withAnimation {
                offsets.map { chickens[$0] }.forEach(viewContext.delete)
                
                do {
                    try viewContext.save()
                } catch {
                    let nsError = error as NSError
                    fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
                }
            }
        }
    }
}
