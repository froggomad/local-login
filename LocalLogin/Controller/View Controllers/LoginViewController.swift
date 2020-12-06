//
//  ViewController.swift
//  LocalLogin
//
//  Created by Kenny on 12/5/20.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    let approvedUsername = "bob@test.com"
    let approvedPassword = "12345678"
    var user: User?

    override func viewDidLoad() {
        // LAST
        usernameTextField.text = UserDefaults.standard.string(forKey: "username")
    }

    @IBAction func loginUser(_ sender: UIButton) {
        // make sure there's text in the username field
        if let username = usernameTextField.text {
            // make sure the username matches the approved username
            if username == approvedUsername {
                // make sure there's text in the password field
                if let password = passwordTextField.text {
                    // make sure the password matches the approved pasword
                    if password == approvedPassword {
                        // assign the username to UserDefaults
                        // LAST
                        UserDefaults.standard.setValue(username, forKey: "username")
                        // assign self.user
                        self.user = User(username: username)
                        // perform the segue
                        performSegue(withIdentifier: "RootViewControllerSegue", sender: nil)
                    }
                }
            }
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // make sure it's the right segue (we might have more than one)
        if segue.identifier == "RootViewControllerSegue" {
            // we're going to a NavigationController first
            // make sure the destination is the right NavigationController
            if let navController = segue.destination as? UINavigationController {
                // we also need to downcast in order to assign user since user doesn't belong to a normal ViewController
                if let destination = navController.viewControllers[0] as? RootViewController {
                    // assign the destination view controller's user property
                    destination.user = self.user
                }
            }
        }
    }

}
