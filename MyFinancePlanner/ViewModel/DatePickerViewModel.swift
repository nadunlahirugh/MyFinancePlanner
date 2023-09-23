//
//  DatePickerViewModel.swift
//  MyFinancePlanner
//
//  Created by Akvasoft Pvt Ltd on 2023-09-23.
//

import Foundation

import SwiftUI

class DatePickerViewModel: ObservableObject {
    @Published var isDatePickerVisible = false
    @Published var selectedDate : String = ""
}
