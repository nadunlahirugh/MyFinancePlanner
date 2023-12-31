//
//  DashboardView.swift
//  MyFinancePlanner
//
//  Created by Akvasoft Pvt Ltd on 2023-09-27.
//

import SwiftUI

struct DashboardView: View {
    
    
    @State var showDatePicker: Bool = false
    @EnvironmentObject var datePickerViewModel: DatePickerViewModel
    @EnvironmentObject var dashboardViewModel: DashboardViewModel
    
    @StateObject var d = DashboardViewModel();
    
    
    @State var subArr: [SubscriptionModel] = [
        SubscriptionModel(dict: ["name":"INCOME", "price": "5.99"] )
        ,
        SubscriptionModel(dict: [
            "name": "EXPENCES",
            
            "price": "18.99"] )
        ,
        SubscriptionModel(dict: ["name": "SAVING",
                                 
                                 "price": "29.99"] )
        ,
        //        SubscriptionModel(dict: ["name": "NetFlix", "icon": "netflix_logo", "price": "15.00"] )
    ]
    
    let colums = [
        GridItem(.adaptive(minimum: 200)),
        GridItem(.adaptive(minimum: 200)),
        GridItem(.adaptive(minimum: 200)),
        
    ]
    
    
    
    
    
    var body: some View {
        
        
        
        
        
        
        ZStack{
            
            VStack{
                NavigationView {
                            Text("")
                                .navigationBarTitle("DASHBOARD", displayMode: .inline)
                                .navigationBarItems(
                                    leading: HStack {
                                        Button(action: {
                                            // Handle the action for the left button here
                                        }) {
                                            Image(systemName: "arrow.left.circle.fill")
                                                .imageScale(.large)
                                        }
                                    },
                                    trailing: HStack {
                                        Button(action: {
                                            // Handle the action for the right button here
                                        }) {
                                            Image(systemName: "gearshape.fill")
                                                .imageScale(.large)
                                        }
                                    }
                                )
                        }
            }
            
            VStack {
                
            
                
              
                
                
               
                
                
                //            VStack {
                //
                //                HStack {
                //                    Text(datePickerViewModel.selectedDate)
                //                        .font(.customfont(.semibold, fontSize: 14))
                //                        .foregroundColor(.gray30)
                //
                //
                //
                //                    Spacer()
                //
                //                    Button {
                //                        showDatePicker = true
                //                    } label: {
                //                        HStack{
                //                            Text(datePickerViewModel.month)
                //                                .font(.customfont(.semibold, fontSize: 14))
                //
                //
                //                            Image(systemName: "chevron.down")
                //                                .resizable()
                //                                .frame(width: 10,height: 10)
                //                        }
                //
                //                    }
                //                    .foregroundColor(.white)
                //                    .padding(.horizontal, 15)
                //                    .padding(.vertical, 4)
                //                    .background(Color.gray60.opacity( 0.2 ))
                //                    .overlay {
                //                        RoundedRectangle(cornerRadius:  16)
                //                            .stroke(  Color.gray70 , lineWidth: 1)
                //                    }
                //                    .cornerRadius(16)
                //                    .sheet(isPresented: $showDatePicker) {
                //                        VStack {
                //
                //                            DatePickerViewInDashboard(
                //                                isModalVisible: $showDatePicker
                //
                //
                //
                //
                //                            )   .presentationDetents([.height(400), .fraction(20), .medium, .large])
                //
                //                        }
                //                        .background(Color.gray40)
                //
                //
                //                    }
                //                    .ignoresSafeArea()
                //
                //
                //                }
                //
                //                Spacer()
                //            }.padding(.top,12).padding()
                
                
                VStack {
                    
                    Text("DAY").alignmentGuide(.leading) { d in
                        d[.leading]
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    LazyVGrid(columns: colums , spacing: 8) {
                        
                        ForEach(subArr) { sObj in
                            SubscriptionCell(sObj: sObj)
                        }
                    }
                    //                .padding(.horizontal,100)
                    .padding(.bottom, 12)
                    
                   
                    
                    
                    
                    Spacer()
                    
                } .padding(.top , 50).padding()
                
                
            }
            
            
        }.background(Color("bgcolour"))
    }
    
    struct DatePickerViewInDashboard: View {
        @Binding var isModalVisible: Bool
        @EnvironmentObject var datePickerViewModel: DatePickerViewModel
        
        var body: some View {
            //        GeometryReader { geo in
            
            VStack {
                DatePicker("", selection: $datePickerViewModel.nowDate, displayedComponents: .date)
                    .datePickerStyle(GraphicalDatePickerStyle())
                    .labelsHidden().onChange(of: datePickerViewModel.nowDate) { newValue in
                        datePickerViewModel.select(date: datePickerViewModel.nowDate)
                        isModalVisible.toggle()
                    }
                
                //                Button("Close Modal") {
                //                    // Call the closure to set the selected date before closing the modal
                //                    //                       setDate(selectedDate)
                //                    isModalVisible.toggle()
                //                }
                //                .padding()
            }  // Adjust size as needed
            .background(Color.white)
            .cornerRadius(10)
            .shadow(radius: 10)
            
            //        }
            
            
        }
        
        
    }
    
    
    struct DashboardView_Previews: PreviewProvider {
        
        
        static var previews: some View {
            
            DashboardView()
        }
    }
}
