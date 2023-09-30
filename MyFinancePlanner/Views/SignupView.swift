//
//  SignupView.swift
//  MyFinancePlanner
//
//  Created by Akvasoft Pvt Ltd on 2023-09-23.
//

import SwiftUI

struct SignupView: View {
    
    @StateObject var loginVM : LoginViewModel = LoginViewModel()
    
    @EnvironmentObject var coordinator : Coordinator
    
    var body: some View {
        ZStack {
             
 //            Color.secondary.opacity(0.2).ignoresSafeArea(edges : .top)
             
             VStack{
                
                         VStack() {
                     
                             Image("signup")
                                 .resizable().aspectRatio(contentMode: .fit)
                                 .frame(width: 150)
                         }.padding()
                     
                 
                 
                 VStack{
                     
                     VStack{


                         TextField("Email", text: $loginVM.email)  .autocapitalization(.none)
                             .frame(height: 40)
                             .textFieldStyle(PlainTextFieldStyle())
                             .padding([.horizontal], 10)
                             .cornerRadius(16)
                             .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray))
                             .padding([.horizontal], 10).background(Color("TextColour")).border(Color("TextColour"))
                     }
                     
                     
                     VStack{
                     
                         
                         TextField("Password", text: $loginVM.password)  .autocapitalization(.none)
                             .frame(height: 40)
                             .textFieldStyle(PlainTextFieldStyle())
                             .padding([.horizontal], 10)
                             .cornerRadius(16)
                             .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray))
                             .padding([.horizontal], 10).background(Color("TextColour")).border(Color("TextColour"))
                     }.padding([.vertical], 10)
                     
                     VStack{
                     
                         
                         TextField("Concirm Password", text: $loginVM.confirmPassword)  .autocapitalization(.none)
                             .frame(height: 40)
                             .textFieldStyle(PlainTextFieldStyle())
                             .padding([.horizontal], 10)
                             .cornerRadius(16)
                             .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray))
                             .padding([.horizontal], 10).background(Color("TextColour")).border(Color("TextColour"))
                     }.padding([.vertical],5)
                     
                     
                     

                     
                     Button(action: {
                               // Action to perform when the button is tapped
                         loginVM.registerUser(){
                             
                             result in
                             
                             switch result {
                             case .success(_):
                                 
                                 coordinator.path.append(.login)
                             case .failure(let error):
                                 loginVM.errorMessage = error.errorMessage
                             }
                             
                         }
                         
                           }) {
                               Text("Sign Up")
                                   .font(.headline)
                                   .padding()
                                   .background(Color.orange) // Set the button's background color
                                   .foregroundColor(.white) // Set the text color
                                   .cornerRadius(10) // Round the button's corners
                           }
                     
                     if let errorMessage = loginVM.errorMessage{
                            Text(errorMessage)
                     }
                     
                 }.padding()
                 
//                 VStack{
//                     HStack{
//                         Text("Don’t have an account ?").alignmentGuide(.leading) { d in
//                             d[.leading]
//                         }
//                         .frame(maxWidth: .infinity, alignment: .leading).padding()
//
//
//
//                     }
//                     HStack{
//
//                     }
//                 }
                 
                 
                 Spacer()
             }.padding(.top,75)
             
           
             
        }.background(Color("bgcolour"))
    }
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}
