//
//  DashboardTop.swift
//  MyFinancePlanner
//
//  Created by Akvasoft Pvt Ltd on 2023-09-28.
//

import SwiftUI

struct DashboardTop: View {
    
@EnvironmentObject var datePickerViewModel: DatePickerViewModel
    @State var showDatePicker: Bool = false
   
    var body: some View {
        
       HStack {
           Text(datePickerViewModel.selectedDate)
                .font(.customfont(.semibold, fontSize: 14))
                .foregroundColor(.gray30)
            
            
            
            Spacer()
            
            Button {
                showDatePicker = true
            } label: {
                HStack{
                    Text(datePickerViewModel.month)
                        .font(.customfont(.semibold, fontSize: 14))
                        
                    
                    Image(systemName: "chevron.down")
                        .resizable()
                        .frame(width: 10,height: 10)
                }
                
            }
            .foregroundColor(.white)
            .padding(.horizontal, 15)
            .padding(.vertical, 4)
            .background(Color.gray60.opacity( 0.2 ))
            .overlay {
                RoundedRectangle(cornerRadius:  16)
                    .stroke(  Color.gray70 , lineWidth: 1)
            }
            .cornerRadius(16)
            .sheet(isPresented: $showDatePicker) {
                VStack {
                    DatePicker("Select Date", selection: $datePickerViewModel.nowDate, displayedComponents: [.date] )
                        .datePickerStyle(GraphicalDatePickerStyle())
                        .cornerRadius(15)
                        .padding()
                        .presentationDetents([.height(400), .fraction(20), .medium, .large])
                    onChange(of: datePickerViewModel.nowDate, perform: { _ in
                        showDatePicker = false
                    })
                        .tint(.secondaryC)
                        .colorScheme(.light)
                    
                    Spacer()
                }
                .background(Color.gray40)
                
                
            }
            .ignoresSafeArea()
        }
    }
}

struct DashboardTop_Previews: PreviewProvider {
    static var previews: some View {
        
        
        DashboardTop().environmentObject(DatePickerViewModel())
    }
}
