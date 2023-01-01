//
//  FaceBookSignIn.swift
//  imokey
//
//  Created by Tugay on 1.01.2023.
//

import Foundation
import FirebaseCore
import FirebaseAuth
import FacebookLogin
typealias ReadPermissions = [String]
struct FacebookSignIn: SignInWithProviderProtocol {
    
    private let readPermissions: ReadPermissions = ["public_profile", "email"]
    
    func signIn(withProvider: SignInProvider) {
//
//        Auth.auth().signIn(with: credential) { (firebaseUser, error) in
//                print(firebaseUser)
//        }
    }
    
    func Login(){
        let loginManager = LoginManager()
        loginManager.logIn(permissions: readPermissions, from: <#T##UIViewController?#>)
    }
    
    
}
