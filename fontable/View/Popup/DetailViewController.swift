//
//  DetailViewController.swift
//  fontable
//
//  Created by 홍태희 on 2022/03/23.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailmg: UIImageView!
    @IBOutlet weak var detsnack: UILabel!
    @IBOutlet weak var detcompany: UILabel!
    @IBOutlet weak var detmoney: UILabel!
    
    @IBAction func detclose(_ sender: Any) {
        dismiss(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}
