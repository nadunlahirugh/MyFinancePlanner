//
//  DropdownViewModel.swift
//  MyFinancePlanner
//
//  Created by Akvasoft Pvt Ltd on 2023-09-26.
//


import Foundation

import SwiftUI

import FirebaseAuth
import FirebaseFirestore

enum dropdownError : Error,Identifiable{
    case error(String)
    var id:UUID{
        UUID()
    }
    
    var errorMessage:String{
        switch self {
        case .error(let message):
            return message
        }
    }
}

class DropdownViewModel: ObservableObject {
    @Published var categorydOption: Option?
    @Published var paymentOption: Option?
    @Published var categoryOptions: [Option] = []
    @Published var PaymentTypeOptions: [Option] = []
    @Published var categoryName: String = ""
    

        func fetchData() {
            // Implement your data fetching logic here, e.g., fetching data from a web API
            // Update the 'options' array with the retrieved data
            
            categoryOptions = [
                Option(name: "smapath bank salary"),
                Option(name: "Option 2"),
                Option(name: "Option 3"),
                       // Add more options as needed
                   ]
            
            PaymentTypeOptions = [
                       Option(name: "INCOME"),
                       Option(name: "EXPENCES"),
                       Option(name: "SAVING"),
                       // Add more options as needed
                   ]
        }
        
    init() {
            // Initialize the properties first
        // Initialize with an appropriate default value

            // Call fetchData() after initializing the properties
            fetchData()
        }
    
    
    func addCategory(completion:@escaping(Result<Bool,dropdownError>) -> Void) {
     
        
        let data = ["Category":self._categoryName]
                
                // Add user data to Firestore
                let db = Firestore.firestore()
        db.collection("category").addDocument(data: data){ error in
                    if let error {
                        DispatchQueue.main.async {
                            completion(.failure(.error(error.localizedDescription)))
                        }
                    } else {
                        DispatchQueue.main.async {
                            completion(.success(true))
                        }
                    }
                }
            
        
    }
}



