//
//  MainViewController.swift
//  Student Registration GDP
//
//  Created by Abhilash Pochampally on 1/29/18.
//  Copyright © 2018 Reddygari,Amarendar Reddy. All rights reserved.
//

import UIKit
import ImagePicker
import Firebase

class MainViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    var studentName:String?
    let store = Storage.storage();
    @IBOutlet weak var nameLBL: UILabel!
    @IBOutlet weak var canvas: UIImageView!
  
    
    @IBAction func chooseImage(_ sender: Any) {
        let imagePickerController = UIImagePickerController()
        let actionSheet = UIAlertController(title: "Photo Source", message: "Choose a source", preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: {(action:UIAlertAction) in
            if UIImagePickerController.isSourceTypeAvailable(.camera){
            imagePickerController.sourceType = .camera
            self.present(imagePickerController, animated: true, completion: nil)
            }else{
                print("Camera Not Available")
            }
        }))
        actionSheet.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: {(action:UIAlertAction) in
//            imagePickerController.sourceType = .photoLibrary
//            self.present(imagePickerController, animated: true, completion: nil)
            let storeRef = self.store.reference()
            let disasterRef = storeRef.child("images/pictures")
            let imagePickerController = ImagePickerController()
            imagePickerController.delegate = self as? ImagePickerDelegate
            //  imagePickerController.delegate = self
            self.present(imagePickerController, animated: true, completion: nil)
        }))
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(actionSheet, animated: true, completion: nil)
    }
    
    @objc func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        canvas.image = image
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLBL.text = studentName
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func sengImage(_ sender: Any) {
//        imageNSData = info[UIImagePickerControllerOriginalImage] as! NSData
//        let storeRef = store.reference()
//        let disasterRef = storeRef.child("images/pictures")
//        let uploadUserProfileTask = disasterRef.child("\(imageNSData).png").putData(imageNSData as! Data, metadata: nil) { (metadata, error) in
//            guard let metadata = metadata else {
//                return
//            }
//            // print("download url for profile is \(metadata.downloadURL)")
//        }
    }
    var imageNSData:NSData?
    
    var imagesStore:[UIImage] = []
    
    func x() {
        
        
        
        imageNSData = UIImagePNGRepresentation(imagesStore[0])! as NSData
        
        let storeRef = store.reference()
        
        let disasterRef = storeRef.child("images/pictures")
   
        let uploadUserProfileTask = disasterRef.child("\(imageNSData).png").putData(imageNSData as! Data, metadata: nil) { (metadata, error) in
            
            guard let metadata = metadata else {
           return
            }
            // print("download url for profile is \(metadata.downloadURL)")
            
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

extension MainViewController: ImagePickerDelegate {
    func wrapperDidPress(_ imagePicker: ImagePickerController, images: [UIImage]) {
        print("sssssssss")
    }
    func doneButtonDidPress(_ imagePicker: ImagePickerController, images: [UIImage]) {
        imagesStore = images
        /// print(imagesStore,"Printing image storess")
        canvas.image = images[0]
        self.x()
        self.dismiss(animated: true, completion: nil)
        // UIImageWriteToSavedPhotosAlbum(info[UIImagePickerControllerOriginalImage] as! UIImage)
    }
    func cancelButtonDidPress(_ imagePicker: ImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
}







