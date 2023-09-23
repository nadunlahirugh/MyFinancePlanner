//
//  SignupView.swift
//  MyFinancePlanner
//
//  Created by Akvasoft Pvt Ltd on 2023-09-23.
//

import SwiftUI

struct SignupView: View {
    
    @StateObject var loginVM : LoginViewModel = LoginViewModel()
    
    var body: some View {
        ZStack{
             
 //            Color.secondary.opacity(0.2).ignoresSafeArea(edges : .top)
             
             VStack{
                
                         VStack() {
                     
                             Image("signIn")
                                 .resizable().aspectRatio(contentMode: .fit)
                                 .frame(width: 150)
                         }.padding()
                     
                 
                 
                 VStack(spacing : 20){
                     
                     VStack{
                         RoundedRectangle(cornerRadius: 10)
                             .foregroundColor(Color("TextColour"))
                             .frame(height: 50)
                             .overlay {
                                 TextField("Email", text: $loginVM.email)
                                     .padding(.leading, 10)
                             }
                     }
                     .padding(.horizontal , 20)
                     
                     VStack{
                         RoundedRectangle(cornerRadius: 10)
                             .foregroundColor(Color("TestColour"))
                             .frame(height: 50)
                             .overlay {
                                 SecureField("Password", text: $loginVM.password)
                                     .padding(.leading, 10)
                             }
                     }
                     .padding(.horizontal , 20)
                     
                     
 //                    Button {
 //
 //                    } label: {
 //
 //                        ZStack {
 //                            LinearGradient(colors: [Color("GradiantStart"), Color("GradiantEnd")], startPoint: .topLeading, endPoint: .bottomTrailing).ignoresSafeArea(edges : .top).clipShape(RoundedRectangle(cornerRadius: 10))
 //                                .frame(height: 50)
 //                            Text("Sign In")
 //                                .foregroundColor(.white)
 //                        }.padding(.horizontal , 20)
 //
 //                    }
                     
                     Button(action: {
                               // Action to perform when the button is tapped
                               print("Button tapped!")
                           }) {
                               Text("Sign In")
                                   .font(.headline)
                                   .padding()
                                   .background(Color.orange) // Set the button's background color
                                   .foregroundColor(.white) // Set the text color
                                   .cornerRadius(10) // Round the button's corners
                           }
                     
                 }.padding()
                 
                 
                 Spacer()
             }
             
             
             
         }
    }
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}
