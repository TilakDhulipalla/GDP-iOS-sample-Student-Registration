//
//  MainViewController.swift
//  Student Registration GDP
//
//  Created by Abhilash Pochampally on 1/29/18.
//  Copyright © 2018 Reddygari,Amarendar Reddy. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    var studentName:String?
    
    @IBOutlet weak var nameLBL: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLBL.text = studentName
        // Do any additional setup after loading the view.
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
