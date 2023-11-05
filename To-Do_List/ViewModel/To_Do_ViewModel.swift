//
//  To_Do_ViewModel.swift
//  To-Do_List
//
//  Created by chirag arora on 05/11/23.
//

import Foundation

class To_Do_ViewModel: ObservableObject {   // (ALL DATA MANIPULATION CODE IS HERE)
    @Published var items: [eachItem] = []
    
    init() {
        loadData()
    }
    
    
    func saveItem(item: eachItem, newItem: Bool) {
        if newItem {
            items.append(item)
            
        } else {
            if let index = items.firstIndex(where: { eachItem in
                eachItem.id == item.id }) {
                items[index] = item
                
            }
        }
        saveData()
    }
    
    func removeItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
        saveData()
    }
    
    func moveItem(fromOffsets: IndexSet, toOffset: Int) {
        items.move(fromOffsets: fromOffsets, toOffset: toOffset)
        saveData()
    }
    
    func completed(item: eachItem) {
        
        
        var newItem = item
        newItem.isCompleted.toggle()
        if let index = items.firstIndex(where: { eachItem in
            eachItem.id == newItem.id }) {
            items[index] = newItem
        }
        saveData()
    }
    
    func loadData() {
        let path = URL.documentsDirectory.appending(component: "items")
        guard let data = try? Data(contentsOf: path) else { return }
        do {
            items = try JSONDecoder().decode(Array<eachItem>.self, from: data)
        } catch {
            print("ERROR: \(error.localizedDescription)")
        }
    }
    
    func saveData() {
        let path = URL.documentsDirectory.appending(component: "items")
        let data = try? JSONEncoder().encode(items)
        do {
            try data?.write(to: path)
        } catch {
            print("ERROR: \(error.localizedDescription)")
        }
    }
    
}
