//
//  ViewController.swift
//  hw24
//
//  Created by Елизавета Метла on 10/3/20.
//

import UIKit
import Kingfisher


class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    var imageURL: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let url = URL(string:imageURL ?? "") {
        imageView.kf.setImage(with: url)
        }
    }
}

