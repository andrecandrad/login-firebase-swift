//
//  LoginViewController.swift
//  login_firebase
//
//  Created by COTEMIG on 23/11/21.
//

import UIKit
import FirebaseAuth
import Firebase

class LoginViewController: UIViewController {

    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var senha: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        checarUsuario()
    }
    
    @IBAction func login(_ sender: Any) {
        validarCampos()
    }
    @IBAction func cadastrar(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "Cadastrar")
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true)
    }
    
    func validarCampos() {
        if email.text?.isEmpty == true {
            print("Campo de E-mail vazio!")
            return
        }
        
        if senha.text?.isEmpty == true {
            print("Campo de senha vazio!")
            return
        }
        
        login()
    }

    func login() {
        Auth.auth().signIn(withEmail: email.text!, password: senha.text!) { [weak self] authResult, err in
            guard let strongSelf = self else {return}
            if let err = err {
                print(err.localizedDescription)
                return
            }
            self!.checarUsuario()
        }
    }
    
    func checarUsuario() {
        if Auth.auth().currentUser != nil {
            print(Auth.auth().currentUser?.uid)
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(identifier: "mainHome")
            vc.modalPresentationStyle = .overFullScreen
            present(vc, animated: true)        }
    }
    
}
