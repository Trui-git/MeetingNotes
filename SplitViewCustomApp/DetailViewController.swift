//
//  DetailViewController.swift
//  SplitViewCustomApp
//
//  Created by TriosMac on 2020-08-27.
//  Copyright © 2020 TriosMac. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    //@IBOutlet var textLabel: UILabel!
    @IBOutlet var textView: UITextView!
    
    
    var detailItem: String? {
        didSet {
            configureView()
        }
    }
    
    func configureView() {
        //if let label = textLabel {
        if let view = textView {
            //label.text = detailItem
            view.text = detailItem
        
            textView.translatesAutoresizingMaskIntoConstraints = true
            textView.sizeToFit()
            textView.isScrollEnabled = false
            //label.numberOfLines = 0
            //label.font = UIFont(name: "Courier", size: 14)
            //label.backgroundColor = UIColor.yellow
            //label.preferredMaxLayoutWidth  = 300
            //label.lineBreakMode = NSLineBreakMode.byWordWrapping
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        
        textView = UITextView()
        textView.sizeThatFits(CGSize(width: textView.frame.size.width, height: textView.frame.size.height))
        
        NotificationCenter.default.addObserver(self, selector:
        #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector:
        #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action:
        #selector(self.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }

    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height/20
            }
        }
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        if ((notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue) != nil {
            if self.view.frame.origin.y != 0 {
                self.view.frame.origin.y = 0
            }
        }
    }
   
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
