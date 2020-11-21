//
//  NavigationModifier.swift
//  NoteTekr
//
//  Created by Tejas M R on 14/11/20.
//

import SwiftUI

// This is used to modify the main views to have a sidebar and a navigation bar title, bar tint color and the foregroundColor of the title

struct NavigationModifier: ViewModifier {
    
    @Environment(\.presentationMode) var presentation
    
    @EnvironmentObject var envObj: EnvObj
    
    func body(content: Content) -> some View {
        content
            
            
            
            // Configure the background and foregroundColor of the Navigation bar of the main view
            .background(NavigationConfigurator { nc in
                nc.navigationBar.barTintColor = UIColor(Color.white)
                nc.navigationBar.titleTextAttributes = [.foregroundColor: UIColor(Color.blue)]
                nc.navigationBar.backgroundColor = UIColor(Color.white)
            })
    }
}
