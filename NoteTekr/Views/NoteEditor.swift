//
//  NoteEditor.swift
//  NoteTekr
//
//  Created by Tejas M R on 14/11/20.
//

import SwiftUI

struct NoteEditor: View {
    
    @Environment(\.managedObjectContext) var viewContext
    
    @FetchRequest(sortDescriptors: [])
    var items: FetchedResults<NoteItem>
    
    @EnvironmentObject var envObj: EnvObj
    
    @State var content: String
    @State var title: String
    
    @State var item: FetchedResults<NoteItem>.Element
    
    
    var body: some View {
        VStack {
            VStack {
                if(self.envObj.editingNoteItemContent) {
                    HStack {
                        Text("Title: ")
                            .font(.headline)
                        TextField(title, text: $title)
                            .font(.headline)
                    }
                    TextEditor(text: $content)
                        .autocapitalization(.words)
                        .disableAutocorrection(true)
                }
                else {
                    VStack(alignment: .leading) {
                        MDText(markdown: content)
                    }
                    .frame(alignment: .topLeading)
                }
            }
            .padding(.horizontal, 20)
            .padding(.top, 10)
        }
        .navigationBarTitle(item.title ?? "Untitled", displayMode: .inline)
        
        .navigationBarItems(trailing: EditContentButton(item: item, content: $content, title: $title))
    }
}

