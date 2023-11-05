//
//  DetailedView.swift
//  To-Do_List
//
//  Created by chirag arora on 04/11/23.
//

import SwiftUI

struct DetailedView: View {
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var to_Dos: To_Do_ViewModel
    @State var item: eachItem
    var newItem = false
    
    var body: some View {  // NO LOGIC HERE (JUST DUMB VIEW)
        
            List {
                TextField("Enter To Do here", text: $item.toDo)
                    .font(.title)
                    .padding(.vertical)
                    .listRowSeparator(.visible)
                
                Toggle("Set Reminder", isOn: $item.reminderOn)
                    .padding(.bottom)
                    .listRowSeparator(.hidden)
                
                DatePicker("Date", selection: $item.dueDate)
                    .padding(.vertical)
                    .listRowSeparator(.hidden)
                    .disabled(!item.reminderOn)
                
                Text("Notes:")
                    .padding(.top)
                TextField("Notes", text: $item.notes, axis: .vertical)
                    .listRowSeparator(.hidden)
                
                Toggle("Completed?", isOn: $item.isCompleted)
                    .padding(.vertical)
                    .listRowSeparator(.hidden)
                    .padding(.vertical)
                    
            }
            .listStyle(.automatic)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Save") {
                        to_Dos.saveItem(item: item, newItem: newItem)
                        dismiss()
                    }
                }
            }
        
        .navigationBarBackButtonHidden()
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    DetailedView(item: eachItem())
}
