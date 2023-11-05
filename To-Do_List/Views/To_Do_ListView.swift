//
//  ContentView.swift
//  To-Do_List
//
//  Created by chirag arora on 04/11/23.
//

import SwiftUI

struct To_Do_ListView: View {   // NO LOGIC HERE (JUST DUMB VIEW)
    @EnvironmentObject var to_Dos: To_Do_ViewModel
    
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(to_Dos.items) { eachItem in
                    
                    HStack {
                        Image(systemName: eachItem.isCompleted ? "checkmark.rectangle" : "rectangle")
                            .onTapGesture {
                                to_Dos.completed(item: eachItem)
                            }
                            .font(.title)
                        NavigationLink {
                            DetailedView(item: eachItem)
                        } label: {
                            Text(eachItem.toDo)
                        }
                    .font(.title2)
                    }
                }
                .onDelete(perform: { indexSet in
                    to_Dos.removeItem(indexSet: indexSet)
                })
                .onMove { fromOffsets, toOffset in
                    to_Dos.moveItem(fromOffsets: fromOffsets, toOffset: toOffset)
                }
            }
            .padding(.top)
            .navigationTitle("ToDo's 📝")
            .navigationBarTitleDisplayMode(.automatic)
            .listStyle(.plain)
            .foregroundColor(Color("Adaptive"))
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    
                        NavigationLink {
                            DetailedView(item: eachItem(), newItem: true)
                        } label: {
                            Image(systemName: "plus.app")
                                .font(.title2)
                        }
                }
                ToolbarItem(placement: .topBarLeading) {
                    EditButton()
                        .font(.title2)
                }
            }
            Text("Add some To-Do's for your day ahead.....")
            
        }
    }
}

#Preview {
    To_Do_ListView()
        .environmentObject(To_Do_ViewModel())
}


