//
//  DropdownViewModel.swift
//  MyFinancePlanner
//
//  Created by Akvasoft Pvt Ltd on 2023-09-26.
//


import Foundation

import SwiftUI

class DropdownViewModel: ObservableObject {
    @Published var selectedOption: Option?
    @Published var options: [Option] = []

        func fetchData() {
            // Implement your data fetching logic here, e.g., fetching data from a web API
            // Update the 'options' array with the retrieved data
            
            options = [
                       Option(name: "smapath bank salary"),
                       Option(name: "Option 2"),
                       Option(name: "Option 3"),
                       // Add more options as needed
                   ]
        }
        
        init() {
            fetchData()
        }
}



