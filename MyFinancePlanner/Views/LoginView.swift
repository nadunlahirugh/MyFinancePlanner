//
//  LoginView.swift
//  MyFinancePlanner
//
//  Created by Akvasoft Pvt Ltd on 2023-09-23.
//

import SwiftUI

struct LoginView: View {
    @StateObject var loginVM : LoginViewModel = LoginViewModel()
    var body: some View {
       ZStack {
            
//            Color.secondary.opacity(0.2).ignoresSafeArea(edges : .top)
            
            VStack{
               
                        VStack() {
                    
                            Image("signIn")
                                .resizable().aspectRatio(contentMode: .fit)
                                .frame(width: 100)
                        }.padding()
                    
                
                
                VStack{
                    
                    VStack{


                        TextField("Email", text: $loginVM.email)
                            .frame(height: 40)
                            .textFieldStyle(PlainTextFieldStyle())
                            .padding([.horizontal], 10)
                            .cornerRadius(16)
                            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray))
                            .padding([.horizontal], 10).background(Color("TextColour")).border(Color("TextColour"))
                    }
                    
                    
                    VStack{
                    
                        
                        SecureField("Password", text: $loginVM.password)
                            .frame(height: 40)
                            .textFieldStyle(PlainTextFieldStyle())
                            .padding([.horizontal], 10)
                            .cornerRadius(16)
                            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray))
                            .padding([.horizontal], 10).background(Color("TextColour")).border(Color("TextColour"))
                    }.padding([.vertical], 10)
                    
                    
                    

                    
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
                
                VStack{
                    HStack{
                        Text("Don’t have an account ?").alignmentGuide(.leading) { d in
                            d[.leading]
                        }
                        .frame(maxWidth: .infinity, alignment: .leading).padding()
                    
                        
                      
                    }
                    HStack{
                      
                    }
                }
                
                
                Spacer()
            }.padding(.top,75)
            
          
            
       }.background(Color("bgcolour"))
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
