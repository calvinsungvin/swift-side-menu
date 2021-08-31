//
//  InfoViewController.swift
//  side menu Medium
//
//  Created by Calvin Sung on 2021/8/31.
//

import UIKit

class InfoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "about this app"
        view.addSubview(label)
    }
    
     var label: UILabel = {
       let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        label.text = "this is the Info Screen."
        label.font = .systemFont(ofSize: 12, weight: .semibold)
        label.textColor = .white
        return label
    }()

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        label.center = view.center
    }

}
