//
//  To_Do_ListApp.swift
//  To-Do_List
//
//  Created by chirag arora on 04/11/23.
//

import SwiftUI

@main
struct To_Do_ListApp: App {  // MAIN THREAD (ALL UI UPDATES FROM HERE)
    @StateObject var to_Dos = To_Do_ViewModel()
    
    var body: some Scene {
        WindowGroup {
            
            To_Do_ListView()
                .environmentObject(to_Dos)
        }
    }
}
