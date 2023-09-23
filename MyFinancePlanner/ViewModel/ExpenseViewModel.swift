//
//  ExpenseViewModel.swift
//  MyFinancePlanner
//
//  Created by Akvasoft Pvt Ltd on 2023-09-23.
//

import Foundation
import SwiftUI

class ExpenseViewModel : ObservableObject {
    
    @Published var date : String = ""
    @Published var category : String = ""
    @Published var amount : String = ""
    @Published var description : String = ""
    @Published var location : String = ""
    
    
    init() {
           updateDateString()
       }

       func updateDateString() {
           let dateFormatter = DateFormatter()
           dateFormatter.dateFormat = "MM/dd/yyyy"
           date = dateFormatter.string(from: Date())
       }
    
   
    
}
