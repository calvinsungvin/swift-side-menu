//
//  HomeViewController.swift
//  side menu Medium
//
//  Created by Calvin Sung on 2021/8/31.
//

import UIKit

protocol HomeViewControllerDelegate {
    func didTapMenuButton()
}

class HomeViewController: UIViewController {
    
    var delegate: HomeViewControllerDelegate?
    
     var label: UILabel = {
       let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        label.text = "this is the Home Screen."
        label.font = .systemFont(ofSize: 12, weight: .semibold)
        label.textColor = .white
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Home"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "list.dash"), style: .done, target: self, action: #selector(didTapMenuButton))
        view.addSubview(label)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        label.center = view.center
    }
    
    @objc func didTapMenuButton() {
        delegate?.didTapMenuButton()
    }
    



}
