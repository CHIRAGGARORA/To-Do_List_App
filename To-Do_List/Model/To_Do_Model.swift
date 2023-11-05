//
//  To_Do_Model.swift
//  To-Do_List
//
//  Created by chirag arora on 05/11/23.
//

import Foundation


struct eachItem : Identifiable, Codable {    // STRUCTURE/BLUEPRINT OF OUR DATA
    var id = UUID().uuidString
    
    
    var toDo = ""
    var reminderOn = false
    var dueDate = Date.now + (60*60)
    var notes = ""
    var isCompleted = false
    
}
