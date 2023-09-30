//
//  ContentView.swift
//  MyFinancePlanner
//
//  Created by Akvasoft Pvt Ltd on 2023-09-14.
//

import SwiftUI

struct ContentView: View {
    @State private var isActive: Bool = false
    var body: some View {
        ZStack {
                   Color("spalshscreen") // Background color for the splash screen
                   
                   VStack {
                       Image("logo") // Replace "your_logo" with the actual name of your image asset
                           .resizable()
                           .aspectRatio(contentMode: .fit)
                           .frame(width: 300, height: 300) // Adjust the size as needed
                       
//                       Text("MyFinancePlanner")
//                           .font(.largeTitle)
//                           .foregroundColor(.white)
//                           .padding(.top, 20)
                   }
               }
               .ignoresSafeArea()
               .onAppear {
                   Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { _ in
                                      isActive = true
                                  }
                              }
                              .navigationBarHidden(true)
                              .navigationBarBackButtonHidden(true)
                              .navigationBarTitle("", displayMode: .inline)
                              .navigationBarItems(leading: EmptyView(), trailing: EmptyView())
                              
                              NavigationLink("", destination: SignupView(), isActive: $isActive)
                                  .isDetailLink(false)
               }
    }



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
