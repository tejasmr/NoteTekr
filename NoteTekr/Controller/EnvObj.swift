//
//  EnvObj.swift
//  NoteTekr
//
//  Created by Tejas M R on 14/11/20.
//

import SwiftUI

class EnvObj: ObservableObject {
    
    @Published var editingNoteItemContent: Bool
    
    init() {
        editingNoteItemContent = false
    }
    
    
}


