//
//  NoteEditor.swift
//  NoteTekr
//
//  Created by Tejas M R on 14/11/20.
//

import SwiftUI

struct NoteEditor: View {
    @Environment(\.presentationMode) var presentation
    
    @Environment(\.managedObjectContext) var viewContext
    
    @FetchRequest(sortDescriptors: [])
    var items: FetchedResults<NoteItem>
    
    @EnvironmentObject var envObj: EnvObj
    
    @State var content: String
    @State var title: String
    @State var editingContent: Bool = false
    
    @State var item: FetchedResults<NoteItem>.Element
    
    
    var body: some View {
        VStack {
            VStack {
                if(self.editingContent) {
                    HStack {
                        Text("Title: ")
                            .font(.headline)
                        TextField(title, text: $title)
                            .font(.headline)
                    }
                    TextEditor(text: $content)
                        .disableAutocorrection(true)
                }
                else {
                    VStack(alignment: .center) {
                        MDText(markdown: content)
                            .multilineTextAlignment(.center)
                    }
                    .frame(alignment: .center)
                }
            }
            .padding(.horizontal, 20)
            .padding(.top, 10)
        }
        .navigationBarTitle(item.title ?? "Untitled", displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        
        .navigationBarItems(leading: Button(action: {
            presentation.wrappedValue.dismiss()
            self.editingContent.toggle()
        }) {
            Image(systemName: "chevron.left")
                .foregroundColor(.blue)
                .imageScale(.large)
        }, trailing: EditContentButton(item: item, content: $content, title: $title, editingContent: $editingContent)
        )
        
    }
}

