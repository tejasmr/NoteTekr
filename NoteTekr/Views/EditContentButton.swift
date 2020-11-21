//
//  EditContentButton.swift
//  NoteTekr
//
//  Created by Tejas M R on 14/11/20.
//

import SwiftUI

struct EditContentButton: View {
    
    @Environment(\.managedObjectContext) var viewContext
    
    @FetchRequest(sortDescriptors: [])
    var items: FetchedResults<NoteItem>
    
    var item: FetchedResults<NoteItem>.Element
    
    @EnvironmentObject var envObj: EnvObj
    
    @Binding var content: String
    @Binding var title: String
    @Binding var editingContent: Bool
    
    var body: some View {
        Button(action: {
            self.editingContent.toggle()
            updateItem(item)
        }) {
            if(self.editingContent) {
                Image(systemName: "square.and.arrow.down")
                    .padding(10)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .clipShape(Circle())
            }
            else {
                Image(systemName: "pencil")
                    .padding(10)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .clipShape(Circle())
            }
        }
    }
    
    func saveContext() {
        do {
            try viewContext.save()
        } catch {
            let error = error as NSError
            fatalError("Unresolved Error: \(error)")
        }
    }
    
    func updateItem(_ item: FetchedResults<NoteItem>.Element) {
        withAnimation {
            item.title = title
            item.content = content
            saveContext()
        }
    }
    
    
}
