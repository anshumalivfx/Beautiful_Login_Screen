//
//  ContentView.swift
//  Assignment_1
//
//  Created by Anshumali Karna on 24/05/24.
//

import SwiftUI
import SwiftData
import FirebaseAuth

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]
    @AppStorage("auth")  var isAuthentication: Bool = false
    var body: some View {
        NavigationSplitView {
            if isAuthentication {
                Button {
                    do {
                        try Auth.auth().signOut()
                        isAuthentication = false
                    } catch {
                        
                    }
                    
                } label: {
                    Text("Logout")
                }

            }
            else {
                LoginView()
                
            }
        } detail: {
            Text("Select an item")
        }
    }

    private func addItem() {
        withAnimation {
            let newItem = Item(timestamp: Date())
            modelContext.insert(newItem)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(items[index])
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
