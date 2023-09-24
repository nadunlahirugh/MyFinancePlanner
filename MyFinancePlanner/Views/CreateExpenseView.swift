//
//  CreateExpenseView.swift
//  MyFinancePlanner
//
//  Created by Akvasoft Pvt Ltd on 2023-09-23.
//

import SwiftUI


struct CreateExpenseView: View {
    
    @ObservedObject var expencesVM: ExpenseViewModel
//       let initializedValue: String
       @State private var isModalVisible = false
//       @State private var selectedDate = Date()
    @State private var selectedDate: Date
    
    let dateFormatter = DateFormatter()
    
    init(expencesVM: ExpenseViewModel) {
           self.expencesVM = expencesVM
        self._selectedDate = State(initialValue: dateFormatter.date(from: expencesVM.date) ?? Date())
        
       }
   
  
    
    var body: some View {
        
       
        
        ZStack {

            
            
            VStack {
                
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(Color("TextColour"))
                    .frame(height: 50)
                    .overlay {
                        Text("Date: \(expencesVM.date)")
                            .foregroundColor(.blue).padding(.leading, 10)
                                 .onTapGesture {
                                     isModalVisible.toggle()
                                 }    .sheet(isPresented: $isModalVisible) {
                                     ModalView(
                                        isModalVisible: $isModalVisible,
                                        selectedDate: $selectedDate,
                                                       modelExpencesVM: self.expencesVM
                                               
                                                   
                                                  )
                                 }
                         }
                     
                    }
//                Text("Date: \(expencesVM.date)")
//                         .foregroundColor(.blue)
//                         .onTapGesture {
//                             isModalVisible.toggle()
//                         }
//                 }
//                 .sheet(isPresented: $isModalVisible) {
//                     ModalView(
//                        isModalVisible: $isModalVisible,
//                        selectedDate: $selectedDate,
//                                       modelExpencesVM: self.expencesVM
//
//
//                                  )
//                 }
           
            
            
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
    @Binding var selectedDate: Date
    var modelExpencesVM: ExpenseViewModel

    var body: some View {
        VStack {
            DatePicker("", selection: $selectedDate, displayedComponents: .date)
                       .datePickerStyle(GraphicalDatePickerStyle())
                       .labelsHidden().onChange(of: selectedDate) { newValue in
                           modelExpencesVM.date = formatDate(date: newValue)
                       }

                   Button("Close Modal") {
                       // Call the closure to set the selected date before closing the modal
//                       setDate(selectedDate)
                       isModalVisible.toggle()
                   }
                   .padding()
               }
    }
    
    func formatDate(date: Date) -> String {
          let dateFormatter = DateFormatter()
          dateFormatter.dateFormat = "MM/dd/yyyy"
          return dateFormatter.string(from: date)
      }
}
struct CreateExpenseView_Previews: PreviewProvider {
//    @StateObject var expencesVM = ExpenseViewModel()
   
    
    static var previews: some View {
        let expencesViewModel = ExpenseViewModel()
                let createExpenseView = CreateExpenseView(expencesVM:expencesViewModel)
                
                return createExpenseView
    }
}
