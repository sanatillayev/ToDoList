//
//  ListViewModel.swift
//  ToDoList
//
//  Created by Bilol Sanatillaev on 21/08/23.
//

import Foundation

/*
 CRUD functions
 
 Create
 Read
 Update
 Delete
 */

class ListViewModel: ObservableObject {
    
    @Published var items: [ItemModel] = [] {
        // after each change saveItems will called
        didSet {
            saveItems()
        }
    }
    
    
    let itemsKey: String = "items_list  "
    
    init() {
        getItems()
    }
    
    func getItems() {
//        let newItems = [
//            ItemModel(title: "This is first item", isCompleted: false),
//            ItemModel(title: "This is second", isCompleted: true),
//            ItemModel(title: "Third", isCompleted: false)
//        ]
//        items.append(contentsOf: newItems)
        
        guard
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data)
        else {
            return
        }
        self.items = savedItems
    }
    
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(title: String) {
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    
    func updateItem(item: ItemModel) {
        if let index =  items.firstIndex(where: {$0.id == item.id}) {
            items[index] = item.updateCompletion()
        }
        /*
         if let index = items.firstIndex(where: { existingItem in
               //            return existingItem.id == item.id
               //        }) {
               //            // run this code
               //        }
         */
    }
    
    func saveItems() {
        // convert data to json
        if let encodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodedData, forKey: itemsKey)
        }
    }
}
