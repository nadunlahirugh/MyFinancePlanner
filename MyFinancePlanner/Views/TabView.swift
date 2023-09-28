//
//  TabView.swift
//  MyFinancePlanner
//
//  Created by Akvasoft Pvt Ltd on 2023-09-23.
//

import SwiftUI




struct TabView: View {

    @State var selectTab: Int = 0
    @State private var selectedTab = 0
    @ObservedObject var expencesVM: ExpenseViewModel
    @ObservedObject var dropdownView: DropdownViewModel
    @ObservedObject var datePickerViewModel: DatePickerViewModel


    init(expencesVM: ExpenseViewModel, dropdownView: DropdownViewModel,datePickerViewModel : DatePickerViewModel) {
        self.expencesVM = expencesVM
                self.dropdownView = dropdownView
                self.datePickerViewModel = datePickerViewModel
        }



    var body: some View {
        
        
        //            if selectTab == 0 {
        //                         DashboardView(datePickerViewModel: datePickerViewModel)
        //                             .frame(width: .screenWidth, height: .screenHeight)
        //                     }
        //
        //                     if selectTab == 1 {
        //                         BudgetView()
        //                             .frame(width: .screenWidth, height: .screenHeight)
        //                     }
        //
        //                     if selectTab == 2 {
        //                         CreateExpenseView(expencesVM: expencesVM, dropdownView: dropdownView)
        //                             .frame(width: .screenWidth, height: .screenHeight)
        //                     }
        
        //            if(selectTab == 3) {
        //
        //                    .frame(width: .screenWidth, height: .screenHeight)
        //            }
        
        
        
        
        ZStack {
            
            if selectTab == 0 {
                DashboardView(datePickerViewModel: datePickerViewModel)
                    .frame(width: .screenWidth, height: .screenHeight)
            }
            
            if selectTab == 1 {
                BudgetView()
                    .frame(width: .screenWidth, height: .screenHeight)
            }
            
            if selectTab == 2 {
                CreateExpenseView(expencesVM: expencesVM, dropdownView: dropdownView)
                    .frame(width: .screenWidth, height: .screenHeight)
            }
            
            
            
            VStack{
                Spacer()
                
                ZStack(alignment: .bottom){
                    
                    
                    
                    ZStack(alignment: .center) {
                        Image("bottom_bar_bg")
                            .resizable()
                            .scaledToFit()
                        
                        HStack(alignment: .center, spacing: 0){
                            
                            Spacer()
                            Button {
                                selectTab = 0
                            } label: {
                                Image("home")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                    .padding()
                            }
                            .foregroundColor( selectTab == 0 ? .white : .gray30 )
                            
                            Spacer()
                            Button {
                                selectTab = 1
                            } label: {
                                Image("budgets")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                    .padding()
                            }
                            .foregroundColor( selectTab == 1 ? .white : .gray30 )
                            
                            
                            Rectangle()
                                .fill(.clear)
                                .frame(width: 80, height: 0)
                            
                            Button {
                                selectTab = 2
                            } label: {
                                Image("calendar")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                    .padding()
                            }
                            .foregroundColor( selectTab == 2 ? .white : .gray30 )
                            
                            Spacer()
                            Button {
                                selectTab = 3
                            } label: {
                                Image("creditcards")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                    .padding()
                            }.border(Color.green)
                            .foregroundColor( selectTab == 3 ? .white : .gray30 )
                            Spacer()
                        }
                    }.border(Color.red,width: 3).frame(height: 200)
                    
                    
                }.border(Color.black)
            }
            .padding(.horizontal, 20)
            .padding(.bottom , .bottomInsets)
            
        }
       
    .background(Color("bgcolour"))
            .ignoresSafeArea()
    



       
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {

        let expencesViewModel = ExpenseViewModel() // Initialize your ExpenseViewModel
        let dropdownViewModel = DropdownViewModel()
        let datePickerViewModel = DatePickerViewModel()// Initialize your DropdownViewModel


        return TabView(expencesVM: expencesViewModel, dropdownView: dropdownViewModel,datePickerViewModel:datePickerViewModel)
    }
}
