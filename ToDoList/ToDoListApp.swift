//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Bilol Sanatillaev on 21/08/23.
//

import SwiftUI
/*
 MVVM Architecture
 Model - data point
 View - UI
 ViewModel - manages model for View
 
 */
@main
struct ToDoListApp: App {
    
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }
            .navigationViewStyle(.stack)
            .environmentObject(listViewModel)
        }
    }
}
