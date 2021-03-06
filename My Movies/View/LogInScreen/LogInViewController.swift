//
//  ViewController.swift
//  My Movies
//
//  Created by karim metawea on 5/10/19.
//  Copyright © 2019 KarimMetawea. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController {

    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       configureCustomUi()
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        userNameTextField.text = "karimmetawea"
        passwordTextField.text = "123456789"
    }
    
    @IBAction func SignInButtonPressed(_ sender: AnyObject) {
        signInButton.isEnabled = false
        signInButton.backgroundColor = UIColor.gray
       
        TMDBClient.getRequestToken(completion: handleGetTokenRequest(success:error:))
        
    }
    
    
    func handleGetTokenRequest(success:Bool,error:Error?){
        
        if success {
            DispatchQueue.main.async {
                let userName = self.userNameTextField.text ?? ""
                let password = self.passwordTextField.text ?? ""
                TMDBClient.login(username: userName, password: password, completion: self.handleLogInRequest(success:error:))
            }
            
            
        } else {
            print("error")
        }
        
        
        DispatchQueue.main.async {
            self.signInButton.isEnabled = true
            self.signInButton.backgroundColor = Theme.tintColor
        }
        
        }
   

    func handleLogInRequest(success:Bool,error:Error?){
        if success {
            TMDBClient.createSessionId(completion: handleSessionIdRequest(success:error:))
            
        }else {
            print("loginrequest error")
        }
    
    }
        
    func handleSessionIdRequest(success:Bool,error:Error?){
        if success {
            DispatchQueue.main.async {
                let storyboard = UIStoryboard(name: "Movies", bundle: nil)
                let vc = storyboard.instantiateInitialViewController() as! UITabBarController
                self.present(vc,animated: true)
            }
            
            
        } else {
            print(error?.localizedDescription ?? "error")
        }
    }
    
    
    
    
    func configureCustomUi(){
        userNameTextField.roundShapeAndMakeShadow( border: 2, ShadowOffset: .zero, borderColor: Theme.tintColor!)
        passwordTextField.roundShapeAndMakeShadow( border: 2, ShadowOffset: .zero, borderColor: Theme.tintColor!)
        signInButton.roundShapeAndMakeShadow(border: 2, ShadowOffset: .zero, borderColor: Theme.accentColor!)
        userNameTextField.setLeftPaddingPoints(15)
        passwordTextField.setLeftPaddingPoints(15)
        
    }


}



