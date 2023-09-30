//
//  BudgetView.swift
//  MyFinancePlanner
//
//  Created by Akvasoft Pvt Ltd on 2023-09-27.
//

import SwiftUI

struct BudgetView: View {
    var body: some View {
        
        ZStack{
          
            VStack{
                NavigationView {
                            Text("")
                                .navigationBarTitle("BUDGET", displayMode: .inline)
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
        }
        
        
        
    }
}

struct BudgetView_Previews: PreviewProvider {
    static var previews: some View {
        BudgetView()
    }
}
