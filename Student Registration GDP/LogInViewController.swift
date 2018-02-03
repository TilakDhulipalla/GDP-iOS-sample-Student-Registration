//
//  LogInViewController.swift
//  Student Registration GDP
//
//  Created by Reddygari,Amarendar Reddy on 1/25/18.
//  Copyright © 2018 Reddygari,Amarendar Reddy. All rights reserved.
//

import UIKit
import FirebaseDatabase
class LogInViewController: UIViewController {

    var ref: DatabaseReference!
    var def: DatabaseReference!
    var databaseHandle:DatabaseHandle!
    var currentUser:String!
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBAction func logIn(_ sender: Any) {
        ref = Database.database().reference()
        def = Database.database().reference()
        ref.child("RegisteredStudents").child("\(userName.text!)").child("password").observe(.value, with: { (snapshot) in
            if snapshot.value as? String == self.passwordTF.text!{
                self.def.child("RegisteredStudents").child("\(self.userName.text!)").child("firstName").observe(.value, with: { (snapshot) in
                    self.currentUser = snapshot.value as! String
                })
                let when = DispatchTime.now() + 0.3 // change 2 to desired number of seconds
                DispatchQueue.main.asyncAfter(deadline: when) {
                    self.performSegue(withIdentifier: "loginSegue", sender: nil)
                    // Your code with delay
                }
                    //print(self.currentUser)
                
                }else{
                    let alertController = UIAlertController(title: "Message", message: "Check your Credentials", preferredStyle: .alert)
                    alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
                    self.present(alertController, animated: true, completion: nil)
                }
            
        })
    
    
    
    }
    
    //https://stackoverflow.com/questions/42256523/swift-get-specific-value-from-firebase-database
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "loginSegue"){
            let mainVC:MainViewController = segue.destination as! MainViewController
            print(self.currentUser)
            mainVC.studentName = currentUser
        
        }
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
