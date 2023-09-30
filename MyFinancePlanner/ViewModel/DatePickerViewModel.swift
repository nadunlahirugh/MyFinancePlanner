//
//  DatePickerViewModel.swift
//  MyFinancePlanner
//
//  Created by Akvasoft Pvt Ltd on 2023-09-23.
//

import Foundation

import SwiftUI

class DatePickerViewModel: ObservableObject {
    
    @Published var selectedDate: String = ""
    @Published var nowDate = Date()
    @Published var month: String = ""
    
    
    init() {
        
           setTodayDateToString()
       }

       func setTodayDateToString() {
           let dateFormatterInDate = DateFormatter()
           dateFormatterInDate.dateFormat = "yyyy-MM-dd"
           selectedDate = dateFormatterInDate.string(from: nowDate)
           
           
           
           
          let dateFormatterInMonth = DateFormatter()
           dateFormatterInMonth.dateFormat = "MMMM"
           month = dateFormatterInMonth.string(from: nowDate)
       }
    
    func select(date: Date) {
        
        
        let dateFormatterInDate = DateFormatter()
        dateFormatterInDate.dateFormat = "yyyy-MM-dd"
        selectedDate = dateFormatterInDate.string(from: date)
        
        let dateFormatterInMonth = DateFormatter()
        dateFormatterInMonth.dateFormat = "MMMM"
        month = dateFormatterInMonth.string(from: date)
      
        
        
    }
    
    
    func selectToString(date: Date) {
        
        
        let dateFormatterInDate = DateFormatter()
        dateFormatterInDate.dateFormat = "yyyy-MM-dd"
        selectedDate = dateFormatterInDate.string(from: date)
        
     
      
        
        
    }
    
   
}
