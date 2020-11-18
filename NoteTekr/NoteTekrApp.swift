//
//  NoteTekrApp.swift
//  NoteTekr
//
//  Created by Tejas M R on 14/11/20.
//

import SwiftUI

@main
struct NoteTekrApp: App {
    
    let persistenceContainer = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(EnvObj())
                .environment(\.managedObjectContext, persistenceContainer.container.viewContext)
        }
    }
}

struct NoteTekrApp_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(EnvObj())
            .environment(\.managedObjectContext, persistenceContainer.container.viewContext)
    }
}
