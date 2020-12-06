//
//  RootViewController.swift
//  LocalLogin
//
//  Created by Kenny on 12/5/20.
//

import UIKit

class RootViewController: UIViewController {
    var user: User?

    override func viewDidLoad() {
        super.viewDidLoad()
        print(user?.username)
    }
}
