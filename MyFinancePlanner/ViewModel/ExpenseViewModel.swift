//
//  ExpenseViewModel.swift
//  MyFinancePlanner
//
//  Created by Akvasoft Pvt Ltd on 2023-09-23.
//

import Foundation
import SwiftUI

import FirebaseAuth
import FirebaseFirestore

enum expenceError : Error,Identifiable{
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

class ExpenseViewModel : ObservableObject {
    
    @Published var date : String = ""
    @Published var category : String = ""
    @Published var amount : Double?
    @Published var amountString = ""
    @Published var description : String = ""
    @Published var paymentType : String = ""
    @Published var categoryId : String = ""
    @Published var errorMessage: String?
    
    
    func addExpences(completion:@escaping(Result<Bool,expenceError>) -> Void) {
        print("CHHHHHHHHHHHHHHHHHH")
        print(date)
        
        if self.date.isEmpty {
            self.nowDateToString()
        }
        
        if let value = Double(amountString) {
                          amount = value
        } else {
                          // Handle invalid input here, e.g., show an error message
                      }
        
        
        let data = ["createdDate": self.date,"Category":self.category,"amount":self.amount,"description":self.description,"paymentType" : self.paymentType,"categoryId":self.categoryId] as [String : Any]
                
                // Add user data to Firestore
                let db = Firestore.firestore()
        db.collection("expences").addDocument(data: data){ error in
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
    
   
    func nowDateToString() {
        
        
        let dateFormatterInDate = DateFormatter()
        dateFormatterInDate.dateFormat = "yyyy-MM-dd"
        date = dateFormatterInDate.string(from: Date())
        
     
      
        
        
    }
    
}
