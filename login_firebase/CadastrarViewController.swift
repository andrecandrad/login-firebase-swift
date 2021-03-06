//
//  CadastrarViewController.swift
//  login_firebase
//
//  Created by COTEMIG on 23/11/21.
//

import UIKit
import FirebaseAuth
import Firebase

class CadastrarViewController: UIViewController {

    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var senha: UITextField!
    @IBOutlet weak var confirmarSenha: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func cadastrar(_ sender: Any) {
        if email.text?.isEmpty == true {
            print("Nenhum E-mail foi informado")
            alert(mensagem: "Nenhum E-mail foi informado")
            return
        }
        
        if senha.text?.isEmpty == true {
            print("Nenhuma senha foi informada")
            alert(mensagem: "Nenhuma senha foi informada!")
            return
        }
        
        if confirmarSenha.text?.isEmpty == true {
            print("A confirmacao da senha nao foi informada")
            alert(mensagem: "A confirmacao da senha nao foi informada")
            return
        }
        
        if senha.text != confirmarSenha.text {
            print("As senhas informadas nao sao iguais")
            alert(mensagem: "As senhas informadas nao sao iguais")
            return
        }
        
        cadastrar()
    }
    
    @IBAction func jaTemUmaConta(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "Login")
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true)
    }
    
    func cadastrar() {
        Auth.auth().createUser(withEmail: email.text!, password: senha.text!) { (authResult, error) in
            guard let user = authResult?.user, error == nil else {
                print("Erro \(error?.localizedDescription)")
                self.alert(mensagem: error!.localizedDescription)
                return
            }
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "mainHome")
            vc.modalPresentationStyle = .overFullScreen
            self.present(vc, animated: true)
            
        }
    }
    
    func alert(mensagem: String) {
        let alert = UIAlertController(title: "", message: mensagem, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        
        self.present(alert, animated: true)    }
}

