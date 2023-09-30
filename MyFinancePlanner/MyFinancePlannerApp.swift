//
//  MyFinancePlannerApp.swift
//  MyFinancePlanner
//
//  Created by Akvasoft Pvt Ltd on 2023-09-14.
//

import SwiftUI
import Firebase

enum Route : Hashable {
    case login
}


class Coordinator : ObservableObject{
    @Published var path = [Route]()
}

@main
struct MyFinancePlannerApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @ObservedObject var coordinator = Coordinator()
    @ObservedObject var  dropdownViewModel = DropdownViewModel()
    @ObservedObject var  datePickerViewModel = DatePickerViewModel()
    @ObservedObject var  expenseViewModel = ExpenseViewModel()
    @ObservedObject var  dashboardViewModel = DashboardViewModel()
    
 
 
  
    
    
    
    var body: some Scene {
        WindowGroup {
        
            TabView()
//                    .environmentObject(datePickerViewModel).environmentObject(dashboardViewModel)
                    
//                    .environmentObject(expenseViewModel).environmentObject(dropdownViewModel)
                
                
                
            }
        }
    }


//class AppDelegate: NSObject, UIApplicationDelegate {
//  func application(_ application: UIApplication,
//                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
//    FirebaseApp.configure()
//
//    return true
//  }
//}

//@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure() // Configure Firebase here
        return true
    }

    // ...
}
