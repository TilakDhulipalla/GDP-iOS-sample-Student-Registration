//
//  Student.swift
//  Student Registration GDP
//
//  Created by Reddygari,Amarendar Reddy on 1/28/18.
//  Copyright © 2018 Reddygari,Amarendar Reddy. All rights reserved.
//

import UIKit

class Student: NSObject {
    var fName : String
    var lName : String
    var email : String
    
    init(fName:String, lName:String, email:String) {
        self.fName = fName
        self.lName = lName
        self.email = email
    }
}
