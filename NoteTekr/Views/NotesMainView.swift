//
//  NotesMainView.swift
//  NoteTekr
//
//  Created by Tejas M R on 14/11/20.
//

import SwiftUI

struct NotesMainView: View {
    
    @Environment(\.managedObjectContext) var viewContext
    
    @FetchRequest(sortDescriptors: [])
    var items: FetchedResults<NoteItem>
    
    
    @EnvironmentObject var envObj: EnvObj
    
    
    var body: some View {
        
        VStack {
            List {
                ForEach(items) { item in
                    NavigationLink(destination: NoteEditor(content: item.content ?? "", title: item.title ?? "Untitled", item: item)
                    ) {
                        Text(item.title ?? "Untitled")
                            .font(.headline)
                            .fontWeight(.bold)
                    }
                }
                .onDelete(perform: deleteItem)
            }
            .modifier(NavigationModifier())
            
            
            Button(action: {
                addItem(title: "Untitled", color: "blue", content: "No content available")
            }) {
                Image(systemName: "plus.circle.fill")
                    .resizable()
                    .frame(width: 40, height: 40, alignment: .center)
                    .foregroundColor(.blue)
            }
            .padding(.bottom, 10)
        }
    }
    
    func addItem(title: String, color: String, content: String) {
        withAnimation {
            let newItem = NoteItem(context: viewContext)
            newItem.title = title
            newItem.color = color
            newItem.content = content
            
            saveContext()
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
    
    func deleteItem(offsets: IndexSet) {
            withAnimation {
                offsets.map {
                    items[$0]
                }
                .forEach(viewContext.delete)
                
                saveContext()
            }
        }
}
