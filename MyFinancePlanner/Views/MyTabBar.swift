////
////  MyTabBar.swift
////  MyFinancePlanner
////
////  Created by Akvasoft Pvt Ltd on 2023-09-28.
////
//
//import SwiftUI
//
//struct MyTabBar: View {
//    
//    var expencesVM: ExpenseViewModel
//    var dropdownView: DropdownViewModel
//    var datePickerViewModel: DatePickerViewModel
//    
//    init(expencesVM: ExpenseViewModel, dropdownView: DropdownViewModel, datePickerViewModel: DatePickerViewModel) {
//        self.expencesVM = expencesVM
//        self.dropdownView = dropdownView
//        self.datePickerViewModel = datePickerViewModel
//    }
//    
//    
//    
//    var body: some View {
//        ZStack{
//            VStack{
//                TabView {
//                    DashboardView(datePickerViewModel: datePickerViewModel)
//                    
//                        .tabItem {
//                            Image("home")
//                            
//                        }
//                    
//                    BudgetView().tabItem {
//                        Image("budgets")
//                    }
//                    
//                    CreateExpenseView(expencesVM: expencesVM, dropdownView: dropdownView).tabItem {
//                        Image("calendar").tag(3)
//
//                    }
//                    
//                   
//                    
//                    
//                }.border(Color.black)
//            }
//        }
//      
//    }
//    
//}
//
//
//struct MyTabBar_Previews: PreviewProvider {
//    static var previews: some View {
//      
//        
//        let expencesViewModel = ExpenseViewModel()
//               let dropdownViewModel = DropdownViewModel()
//               let datePickerViewModel = DatePickerViewModel()
//               
//               return MyTabBar(
//                   expencesVM: expencesViewModel,
//                   dropdownView: dropdownViewModel,
//                   datePickerViewModel: datePickerViewModel
//               )
//    }
//}
