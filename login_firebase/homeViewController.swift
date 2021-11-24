//
//  homeViewController.swift
//  login_firebase
//
//  Created by COTEMIG on 24/11/21.
//

import UIKit
import FirebaseAuth
import Firebase

class homeViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func logOut(_ sender: Any) {
        do{
            try Auth.auth().signOut()
        } catch {
            print("Erro ao Fazer o LogOut")
        }
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "Login")
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true)    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
