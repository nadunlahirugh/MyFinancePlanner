//
//  CreateExpenseView.swift
//  MyFinancePlanner
//
//  Created by Akvasoft Pvt Ltd on 2023-09-23.
//

import SwiftUI

struct CreateExpenseView: View {
    
    
    @EnvironmentObject var datePickerViewModel : DatePickerViewModel
    @EnvironmentObject var expencesVM : ExpenseViewModel
    @EnvironmentObject var dropdownViewModel : DropdownViewModel
    @State var showDatePicker: Bool = false
    @State var showCategoryDropdown : Bool = false
    @State var showPaymentTypeDropdown: Bool = false
    
 
 
    
    
var body: some View {
        
        
        
        ZStack {
            
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
            
            
//            dropdownList
            VStack{
                Text("Payment Type")
                HStack {
                    VStack {
                             RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(Color("TextColour"))
                            .frame(height: 50)
                                 .overlay(
                                     HStack {
                                         Text(self.dropdownViewModel.paymentOption?.name
                                            
                                            
                                      ?? "Select Payment Option")
                                             .padding(.leading, 10)
                                         Spacer()
                                         Image(systemName: "arrowtriangle.down.fill")
                                             .padding(.trailing, 10)
                                     }
                                 )
                        
                                 .sheet(isPresented: $showPaymentTypeDropdown) {
                                             VStack {

                    createExpensePaymentTypeModel(
                                showPaymentTypeDropdown: $showPaymentTypeDropdown
                                                 

                                                     
                                                 )   .presentationDetents([.height(150), .fraction(20), .medium, .large])
                                                 
                                             }
                                             .background(Color.gray40)
                                             
                                             
                                         }
                                         .ignoresSafeArea()
                                 .onTapGesture {
                                     showPaymentTypeDropdown.toggle()
                                 }
                                 


//                             }
                         }
                           

                       }
                
                Spacer()
            }.padding(.top,20).padding()
            
            
            //            dropdownList
                        VStack{
                            Text("Category")
                            HStack {
                                VStack {
                                         RoundedRectangle(cornerRadius: 10)
                                        .foregroundColor(Color("TextColour"))
                                        .frame(height: 50)
                                             .overlay(
                                                 HStack {
                                                     Text(dropdownViewModel.categorydOption?.name
                                                        
                                                        
                              ?? "Select Category")
                                                         .padding(.leading, 10)
                                                     Spacer()
                                                     Image(systemName: "arrowtriangle.down.fill")
                                                         .padding(.trailing, 10)
                                                 }
                                             )
                                    
                                             .sheet(isPresented: $showCategoryDropdown) {
                                                 VStack {
                                                     
                                                     
                                                     createExpenseCategoryModel(
                                                        showCategoryDropdown: $showCategoryDropdown
                                                        
                                                        
                                                        
                                                     )   .presentationDetents([.height(500)])}
                                                     
                                                     
                                                     
                                                     
                                                 
                                                         .background(Color.gray40)
                                                         
                                                         
                                                     }
                                                     .ignoresSafeArea()
                                             .onTapGesture {
                                                 showCategoryDropdown.toggle()
                                             }
                                             


            //                             }
                                     }
                                       

                                   }
                            
                            Spacer()
                        }.padding(.top,120).padding()
       
            
          
            
//            date
            VStack {
                Text("Select Date")


                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(Color("TextColour"))
                    .frame(height: 50)
                    .overlay {
                        
                        Text("Date: \(datePickerViewModel.selectedDate)")
                            .foregroundColor(.black)
                  
                        
                    .sheet(isPresented: $showDatePicker) {
                                VStack {

                                    DatePickerViewInCreateExpence(
                                        showDatePicker: $showDatePicker
                                    

                                        
                                    )   .presentationDetents([.height(400), .fraction(20), .medium, .large])
                                    
                                }
                                .background(Color.gray40)
                                
                                
                            }
                            .ignoresSafeArea()
                    }.onTapGesture {
                        showDatePicker.toggle()
                    }
                Spacer()
            }.padding(.top,220).padding()
            
            
          
            
            
//           amount
            VStack{
                Text("Select Amount")
                
                TextField("Amount", text: $expencesVM.amountString)
                    .frame(height: 50)
                    .textFieldStyle(PlainTextFieldStyle())
                    .padding([.horizontal], 4)
                    .cornerRadius(16)
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray))
                    .padding([.horizontal], 2).background(Color("TextColour")).border(Color("TextColour"))
                
           
                
//                RoundedRectangle(cornerRadius: 10)
//                    .foregroundColor(Color("TextColour"))
//                    .frame(height: 50)
//                    .overlay {
//                        TextField("Amount", text: $expencesVM.amount).border(Color.black)
//
//                    }
                
                Spacer()
            }.padding(.top,320).padding()
            
            
            VStack(){
                Text("Select description")
                
                TextField("description", text: $expencesVM.description).lineLimit(3, reservesSpace: true)
                    .frame(height: 80)
                    .textFieldStyle(PlainTextFieldStyle())
                    .padding([.horizontal], 1)
                    .cornerRadius(16)
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray))
                    .padding([.horizontal], 2).background(Color("TextColour")).border(Color("TextColour"))
                
              
            Spacer()
            }.padding(.top,420).padding()
            
            VStack{
                Button(action: {
                          // Action to perform when the button is tapped
                    expencesVM.addExpences(){
                        
                        result in
                        
                        switch result {
                        case .success(_):
                            
                           print("suceess")
                        
                        case .failure(let error):
                            expencesVM.errorMessage = error.errorMessage
                        }
                        
                    }
                      }) {
                          Text("Sign In")
                              .font(.headline)
                              .padding()
                              .background(Color.orange) // Set the button's background color
                              .foregroundColor(.white) // Set the text color
                              .cornerRadius(10) // Round the button's corners
                      }
                
                if let errorMessage = expencesVM.errorMessage{
                       Text(errorMessage)
                }
            }.padding(.top,450)
            
            
        }
    }
    
    struct DatePickerViewInCreateExpence: View {
        @Binding var showDatePicker: Bool
        @EnvironmentObject var expencesVM : ExpenseViewModel
        @EnvironmentObject var datePickerViewModel: DatePickerViewModel
        
        var body: some View {
            //        GeometryReader { geo in
                        
                        VStack {
                            DatePicker("", selection: $datePickerViewModel.nowDate, displayedComponents: .date)
                                .datePickerStyle(GraphicalDatePickerStyle())
                                .labelsHidden().onChange(of: datePickerViewModel.nowDate) { newValue in
                                    datePickerViewModel.selectToString(date: datePickerViewModel.nowDate)
                                    
                                    expencesVM.date = datePickerViewModel.selectedDate
                                    showDatePicker.toggle()
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
        
//        func formatDate(date: Date) -> String {
//            let dateFormatter = DateFormatter()
//            dateFormatter.dateFormat = "MM/dd/yyyy"
//            return dateFormatter.string(from: date)
//        }
    }
    
    struct createExpensePaymentTypeModel: View {
        @EnvironmentObject var dropdownViewModel : DropdownViewModel
        @EnvironmentObject var expencesVM : ExpenseViewModel
          @Binding var showPaymentTypeDropdown: Bool

        var body: some View {
            
            
                
                VStack {
                    ForEach(dropdownViewModel.PaymentTypeOptions) { option in
                        Button(action: {
                            dropdownViewModel.paymentOption = option
                            expencesVM.paymentType = option.name
                            showPaymentTypeDropdown.toggle()
                        }) {
                            Text(option.name)
                                .frame(width : 400,height: 40) .font(.system(size: 18))                                .foregroundColor(Color.black)
                                .background(Color.white).cornerRadius(10)
                            
                        }
                    }.border(Color.gray).cornerRadius(10)
                    
                    Spacer()
                }
                
               // Adjust size as needed
                .background(Color.white)
                .cornerRadius(10)
                .shadow(radius: 10)
         
                
                
            
        }
    }
    
    
    struct createExpenseCategoryModel: View {
        @EnvironmentObject var dropdownViewModel : DropdownViewModel
        @EnvironmentObject var expencesVM : ExpenseViewModel
        @Binding var showCategoryDropdown: Bool
        
        var body: some View {
            
            ZStack{
                
                Color.white
                VStack{
                    
                    
                    TextField("Enter new Category", text: $dropdownViewModel.categoryName)
                        .frame(width: 350, height: 50)
                        .textFieldStyle(PlainTextFieldStyle())
                        .padding([.horizontal], 4)
                        .cornerRadius(16)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10).stroke(Color.gray))
                        .padding([.horizontal], 0).background(Color("TextColour")).border(Color("TextColour"))
                    
                    
                    
                    
                    
                    
                    
                    
                    Spacer()
                    
                    
                }.padding().padding(.top,20)
               
                
                
                VStack{
                    
                    ScrollView {
                        VStack {
                            ForEach(dropdownViewModel.categoryOptions) { option in
                                Button(action: {
                                    dropdownViewModel.categorydOption = option
                                    expencesVM.category = option.name
                                    expencesVM.categoryId = option.id.uuidString
                                    showCategoryDropdown.toggle()
                                }) {
                                    Text(option.name)
                                        .frame(height: 40) .font(.system(size: 18))                                .foregroundColor(Color.black)
//                                        .background(Color.white)
                                        .cornerRadius(10)

                                }
                            
                            }.border(Color.gray).cornerRadius(10).background(Color.blue)
                          
                        }.padding()

                        // Adjust size as needed
    //                        .background(Color.white)
                        //                .cornerRadius(10)
                        //                .shadow(radius: 10)


                    }.border(Color.red).padding(10).frame(height: 220).cornerRadius(20)
                    
                    Spacer()
                }.padding(.top,100)
                
                
                
                Button(action: {
                    // Action to perform when the button is tapped
                    expencesVM.addExpences(){
                        
                        result in
                        
                        switch result {
                        case .success(_):
                            
                            print("suceess")
                            
                        case .failure(let error):
                            expencesVM.errorMessage = error.errorMessage
                        }
                        
                    }
                }){
                    Text("Add Category").frame(width: 350)
                        .font(.headline)
                        .padding()
                        .background(Color.orange) // Set the button's background color
                        .foregroundColor(.white) // Set the text color
                        .cornerRadius(10).padding(.top,200) // Round the button's corners
                }
                
                if let errorMessage = expencesVM.errorMessage{
                    Text(errorMessage)
                }
                
                
            }
            
            
        }
    }
    
    
    struct CreateExpenseView_Previews: PreviewProvider {
      
      
        
        
        
        static var previews: some View {
            
            @ObservedObject var  dropdownViewModel = DropdownViewModel()
            @ObservedObject var  datePickerViewModel = DatePickerViewModel()
            @ObservedObject var  expenseViewModel = ExpenseViewModel()
      
            
            
            CreateExpenseView().environmentObject(dropdownViewModel).environmentObject(datePickerViewModel).environmentObject(expenseViewModel)
        }
    }
}
