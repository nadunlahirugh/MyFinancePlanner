//
//  LoginViewModel.swift
//  MyFinancePlanner
//
//  Created by Akvasoft Pvt Ltd on 2023-09-23.
//

import Foundation
import SwiftUI

class LoginViewModel : ObservableObject {
    
    @Published var email : String = ""
    @Published var password : String = ""
    @Published var confirmPassword : String = ""
    
    @Published var showSignInView : Bool = false
   
    
}
