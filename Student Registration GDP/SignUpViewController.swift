//
//  SignUpViewController.swift
//  Student Registration GDP
//
//  Created by Reddygari,Amarendar Reddy on 1/25/18.
//  Copyright © 2018 Reddygari,Amarendar Reddy. All rights reserved.
//

import UIKit
import FirebaseDatabase

class SignUpViewController: UIViewController {

    var ref: DatabaseReference!
    
    @IBOutlet weak var userNameTF: UITextField!
    @IBOutlet weak var firstNameTF: UITextField!
    @IBOutlet weak var lastNameTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    @IBAction func signUP(_ sender: Any) {
        let newStudent = ["email" : emailTF.text,
                       "firstName" : firstNameTF.text,
                       "lastName" : lastNameTF.text,
                       "password" : passwordTF.text]
        let newRegistration = ["/RegisteredStudents/\(userNameTF.text!)": newStudent]
        ref.updateChildValues(newRegistration)
        userNameTF.text = ""
        firstNameTF.text = ""
        lastNameTF.text = ""
        emailTF.text = ""
        passwordTF.text = ""
        let alertController = UIAlertController(title: "Message", message: "Successfully SignedIn, you can now logIn", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
        self.present(alertController, animated: true, completion: nil)    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
