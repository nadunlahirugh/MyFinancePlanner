//
//  DashboardViewModel.swift
//  MyFinancePlanner
//
//  Created by Akvasoft Pvt Ltd on 2023-09-29.
//

//import Foundation
//
//import Firebase
//import FirebaseFirestore
//
//enum dashboardError : Error,Identifiable{
//    case error(String)
//    var id:UUID{
//        UUID()
//    }
//
//    var errorMessage:String{
//        switch self {
//        case .error(let message):
//            return message
//        }
//    }
//}
//
//
//class DashboardViewModel: ObservableObject {
//
//    @Published var Expences: [SubscriptionModel] = []
//    @Published var errorMessage: String?
//
//
//
//    init() {
////       fetchData()
//
//    }
//
////       func fetchData() {
////
////           let db = Firestore.firestore()
////                  var expencesTotalAmount: Double = 0
////                  var incomeTotalAmount: Double = 0
////                  var savingTotalAmount: Double = 0
////
////           db.collection("expences").getDocuments { [self] querySnapshot, error in
////                   if let error = error {
////                       print("Error fetching data: \(error.localizedDescription)")
////                       return
////                   }
////
////                   guard let documents = querySnapshot?.documents else {
////                       return
////                   }
////
//////                   self.people = []
////
////               for document in documents {
////                   let data = document.data()
////
////                   if let paymentType = data["paymentType"] as? String {
////                       if paymentType == "EXPENCES" {
////                           if let amount = data["amount"] as? Double {
////                               expencesTotalAmount += amount
////                           }
////                       } else if paymentType == "INCOME" {
////                           if let amount = data["amount"] as? Double {
////                               incomeTotalAmount += amount
////                           }
////                       } else if paymentType == "SAVING" {
////                           if let amount = data["amount"] as? Double {
////                               savingTotalAmount += amount
////                           }
////                       }
////                   }
////               }
////
////            }
////
////           var expencesTotalAmountString: String {
////               return String(format: "%.2f", expencesTotalAmount)
////           }
////
////           var incomeTotalAmountString: String {
////               return String(format: "%.2f", expencesTotalAmount)
////           }
////
////           var savingTotalAmountString: String {
////               return String(format: "%.2f", expencesTotalAmount)
////           }
////
////
////           let dictOne: NSDictionary = ["name": "EXPENCES", "price": expencesTotalAmountString]
////           let expencesSubscription = SubscriptionModel(dict: dictOne)
////           Expences.append(expencesSubscription)
////
////           let dictTwe: NSDictionary = ["name": "INCOME", "price": incomeTotalAmountString]
////           let incomeSubscription = SubscriptionModel(dict: dictTwe)
////           Expences.append(incomeSubscription)
////
////
////           let dictthree: NSDictionary = ["name": "SAVING", "price": savingTotalAmountString]
////           let savingSubscription = SubscriptionModel(dict: dictthree)
////           Expences.append(savingSubscription)
////
//////           var totalAmount : Double = 0
//////
//////           db.collection("expences")
//////               .whereField("paymentType", isEqualTo: "EXPENCES")
//////               .getDocuments { querySnapshot, error in
//////                   if let error = error {
//////                       print("Error fetching data: \(error.localizedDescription)")
//////                       return
//////                   }
//////
//////                   guard let documents = querySnapshot?.documents else {
//////                       return
//////                   }
//////
////////                   self.people = []
//////
//////                   for document in documents {
//////
//////                       let data = document.data()
//////
//////                       if let amount = data["amount"] as? Double {
//////                           totalAmount += amount
//////                       }
//////
//////
//////
//////                }
//////
//////                   print(totalAmount)
//////               }
////       }
//
//
//
//}
//
   




import Firebase
import FirebaseFirestore
import Combine

class DashboardViewModel: ObservableObject {
    @Published var data: [String] = []
    private var cancellables: Set<AnyCancellable> = []

    init() {
//        fetchAll()
    }

//    func fetchData() {
//        if let user = Auth.auth().currentUser {
//            let db = Firestore.firestore()
//            let collection = db.collection("your_collection_name") // Replace with your collection name
//
//            collection.whereField("userId", isEqualTo: user.uid)
//                .addSnapshotListener { (querySnapshot, error) in
//                    if let error = error {
//                        print("Error fetching data: \(error)")
//                        return
//                    }
//
//                    if let documents = querySnapshot?.documents {
//                        self.data = documents.compactMap { document in
//                            let data = document.data()
//                            return data["your_field_name"] as? String // Replace with your field name
//                        }
//                    }
//                }
//                .store(in: &cancellables)
//        }
//    }
//    
//    func fetchAll() {
//            let db = Firestore.firestore()
//
//            db.collection("expences").getDocuments() { (querySnapshot, error) in
//                            if let error = error {
//                                    print("Error getting documents: \(error)")
//                            } else {
//                                    for document in querySnapshot!.documents {
//                                            print("\(document.documentID): \(document.data())")
//                                    }
//                            }
//            }
//    }
}



