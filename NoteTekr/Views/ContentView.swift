//
//  ContentView.swift
//  NoteTekr
//
//  Created by Tejas M R on 14/11/20.
//

import SwiftUI

let persistenceContainer = PersistenceController.shared



struct ContentView: View {
    
    @EnvironmentObject var envObj: EnvObj
    
    var body: some View {
        
        NavigationView {
            VStack {
                VStack {
                    NotesMainView()
                }
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .navigationBarTitle("Note Tekr", displayMode: .inline)
            .navigationBarBackButtonHidden(true)
        }
        .accentColor(Color.blue)
        .environmentObject(envObj)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(EnvObj())
            .environment(\.managedObjectContext, persistenceContainer.container.viewContext)
    }
}
