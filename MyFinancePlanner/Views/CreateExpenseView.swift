//
//  CreateExpenseView.swift
//  MyFinancePlanner
//
//  Created by Akvasoft Pvt Ltd on 2023-09-23.
//

import SwiftUI

struct CreateExpenseView: View {
    
    @ObservedObject var expencesVM: ExpenseViewModel
    @ObservedObject var dropdownView: DropdownViewModel
    //       let initializedValue: String
  
    //       @State private var selectedDate = Date()
    @State private var selectedDate: Date
    
    let dateFormatter = DateFormatter()
    
    @State private var isModalVisible = false
    @State private var isCategoryModalVisible = false
 
    
    
    init(expencesVM: ExpenseViewModel, dropdownView: DropdownViewModel) {
        self.expencesVM = expencesVM
        self.dropdownView = dropdownView
         // Initialize your options array with appropriate values
        self._selectedDate = State(initialValue: dateFormatter.date(from: expencesVM.date) ?? Date())
        self._isModalVisible = State(initialValue: false)
        self._isCategoryModalVisible = State(initialValue: false)
        
      }
    
  var body: some View {
        
        
        
        ZStack {
            
            
//            dropdownList
            VStack{
                HStack {
                    VStack {
                             RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(Color("TextColour"))
                            .frame(height: 50)
                                 .overlay(
                                     HStack {
                                         Text(dropdownView.selectedOption?.name ?? "Select an option")
                                             .padding(.leading, 10)
                                         Spacer()
                                         Image(systemName: "arrowtriangle.down.fill")
                                             .padding(.trailing, 10)
                                     }
                                 ) .sheet(isPresented: $isCategoryModalVisible) {
                                     OptionModal(viewModel: dropdownView, isCategoryModalVisible: $isCategoryModalVisible).frame(maxWidth: .infinity, maxHeight: .infinity)
                                    }
                                 .onTapGesture {
                                     isCategoryModalVisible.toggle()
                                 }
                                 

//                             if isCategoryModalVisible {
//                                 OptionModal(viewModel: dropdownView, isCategoryModalVisible: $isCategoryModalVisible)
//                             }
                         }
                           
                    VStack {
                            
                             IconButton(systemImageName: "star.fill") {
                                 // Action to perform when the button is tapped
                                 print("Button tapped!")
                             }
                         }
                       }
            }
       
            
          
            
//            date
            VStack {
                Text("Select Date")
                
              
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(Color("TextColour"))
                    .frame(height: 50)
                    .overlay {
                        Text("Date: \(expencesVM.date)")
                            .foregroundColor(.blue).padding(.leading)
                        
                        
                                       .sheet(isPresented: $isModalVisible) {
                                        ModalView(
                                            isModalVisible: $isModalVisible,
                                            selectedDate: $selectedDate,
                                            modelExpencesVM: self.expencesVM
                                            
                                            
                                        ).frame(maxWidth: .infinity, maxHeight: .infinity)
                                       }
                    }.onTapGesture {
                        isModalVisible.toggle()
                    }
                Spacer()
            }.padding(.top,20)
            
            
            
//           amount
            VStack(){
                Text("Select Amount")
                
                TextField("Amount", text: $expencesVM.amount)
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
            }
            .padding(.top , 120)
            
            VStack(){
                Text("Select description")
                
                TextField("description", text: $expencesVM.amount).lineLimit(3, reservesSpace: true)
                    .frame(height: 80)
                    .textFieldStyle(PlainTextFieldStyle())
                    .padding([.horizontal], 1)
                    .cornerRadius(16)
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray))
                    .padding([.horizontal], 2).background(Color("TextColour")).border(Color("TextColour"))
                
              
            Spacer()
            }
            .padding(.top , 220)
            
        }
    }
    
    struct ModalView: View {
        @Binding var isModalVisible: Bool
        @Binding var selectedDate: Date
        var modelExpencesVM: ExpenseViewModel
        
        var body: some View {
            GeometryReader { geo in
                
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
                } .frame(width: geo.size.width * 0.8, height: geo.size.height * 0.6) // Adjust size as needed
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(radius: 10)
                    .position(x: geo.size.width / 2, y: geo.size.height / 2)
            }
                
          
        }
        
        func formatDate(date: Date) -> String {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MM/dd/yyyy"
            return dateFormatter.string(from: date)
        }
    }
    
    struct OptionModal: View {
        @ObservedObject var viewModel: DropdownViewModel
          @Binding var isCategoryModalVisible: Bool

        var body: some View {
            
            GeometryReader { geo in
                
                VStack {
                    ForEach(viewModel.options) { option in
                        Button(action: {
                            viewModel.selectedOption = option
                            isCategoryModalVisible.toggle()
                        }) {
                            Text(option.name)
                                .frame(width: geo.size.width - 150, height: 40) .font(.system(size: 18)) // Set a custom font size
                                .foregroundColor(Color.black)
                                .background(Color.white).cornerRadius(10)
                            
                        }
                    }.border(Color.gray).cornerRadius(10)
                    
                    Spacer()
                }
                
                .padding().frame(width: geo.size.width * 0.8, height: geo.size.height * 0.6) // Adjust size as needed
                .background(Color.white)
                .cornerRadius(10)
                .shadow(radius: 10)
                .position(x: geo.size.width / 2, y: geo.size.height / 2)
                
            }
        }
    }
    
    struct IconButton: View {
        let systemImageName: String
        let action: () -> Void

        var body: some View {
            Button(action: action) {
                Image(systemName: systemImageName)
                    .font(.title)
                    .foregroundColor(.blue)
            }
        }
    }
    
    
    struct CreateExpenseView_Previews: PreviewProvider {
        //    @StateObject var expencesVM = ExpenseViewModel()
        
        
        static var previews: some View {
            let expencesViewModel = ExpenseViewModel() // Initialize your ExpenseViewModel
                let dropdownViewModel = DropdownViewModel() // Initialize your DropdownViewModel

                return CreateExpenseView(expencesVM: expencesViewModel, dropdownView: dropdownViewModel)
        }
    }
}
