//
//  CreateExpenseView.swift
//  MyFinancePlanner
//
//  Created by Akvasoft Pvt Ltd on 2023-09-23.
//

import SwiftUI


struct CreateExpenseView: View {
    
//    @StateObject var expencesVM : ExpenseViewModel = ExpenseViewModel()
    @ObservedObject var  expencesVM = ExpenseViewModel()
    
    @StateObject public var viewModel = DatePickerViewModel()
       @State private var dateString = ""
    
    @State private var isModalVisible = false
   
  
    
    var body: some View {
        ZStack {
            VStack {
         
//                Form{
//                    DatePicker("GAGFGAUUF", selection: $selectedDate, displayedComponents: .date)
//                        .datePickerStyle(.compact)
//                }
                
//                HStack {
//                          DatePicker("", selection: $selectedDate, in: ...Date(), displayedComponents: .date)
//                              .datePickerStyle(.compact)
//                              .frame(maxWidth: .infinity)
//                      }
                    
                
            }
            
            
            VStack {
                Text(expencesVM.date)
                         .foregroundColor(.blue)
                         .onTapGesture {
                             isModalVisible.toggle()
                         }
                 }
                 .sheet(isPresented: $isModalVisible) {
                     ModalView(isModalVisible: $isModalVisible)
                 }
           
            
            
            VStack(){
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(Color("TextColour"))
                    .frame(height: 50)
                    .overlay {
                        TextField("Amount", text: $expencesVM.amount)
                            .padding(.leading, 10)
                    }
            }
            .padding(.top , 200)
        
               }
           
        }
    }

struct ModalView: View {
    @Binding var isModalVisible: Bool
    @State private var selectedDate = Date()
    @State private var dateFormat = "MM/dd/yyyy"
    @ObservedObject var  expencesVM = ExpenseViewModel()
//    @Binding var dateString: String

    var body: some View {
        VStack {
            DatePicker("", selection: $selectedDate, displayedComponents: .date)
                           .datePickerStyle(GraphicalDatePickerStyle())
                           .labelsHidden()
                           .onChange(of: selectedDate) { _ in
                               // Update the date string when the selected date changes
                               expencesVM.date = formatDate(date: selectedDate, format: dateFormat)
                               
                               
                               
                           }

            Button("Close Modal") {
                isModalVisible.toggle()
            }
            .padding()
        }
    }
    
    func formatDate(date: Date, format: String) -> String {
          let dateFormatter = DateFormatter()
          dateFormatter.dateFormat = format
          return dateFormatter.string(from: date)
      }
}
struct CreateExpenseView_Previews: PreviewProvider {
//    @StateObject var expencesVM = ExpenseViewModel()
    static var previews: some View {
        CreateExpenseView()
    }
}
