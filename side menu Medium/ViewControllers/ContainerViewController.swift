//
//  ViewController.swift
//  side menu Medium
//
//  Created by Calvin Sung on 2021/8/31.
//

import UIKit

class ContainerViewController: UIViewController {
    
    enum MenuState {
        case opened
        case closed
    }
    
    private var menuState: MenuState = .closed
    let menuVC = MenuViewController()
    let homeVC = HomeViewController()
    var navVC: UINavigationController?
    lazy var infoVC = InfoViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        addChildVCs()
    }
    
    func addChildVCs() {
        //Menu (on Z-axis, it's at the bottom)
        addChild(menuVC)
        view.addSubview(menuVC.view)
        menuVC.didMove(toParent: self)
        menuVC.delegate = self
        
        //Home (on Z-axis, it's at the top)
        homeVC.delegate = self
        let navVC = UINavigationController(rootViewController: homeVC)
        addChild(navVC)
        view.addSubview(navVC.view)
        navVC.didMove(toParent: self)
        self.navVC = navVC
    }
}

extension ContainerViewController: HomeViewControllerDelegate {
    
    func didTapMenuButton() {
        toggleMenu(completion: nil)
    }
    
    func toggleMenu(completion: (() -> Void)?) {
        switch menuState {
        case .closed:
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut) {
                
                self.navVC?.view.frame.origin.x = self.homeVC.view.frame.size.width - 100
                
            } completion: { (done) in
                if done {
                    self.menuState = .opened
                }
            }

        case .opened:
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut) {
                
                self.navVC?.view.frame.origin.x = 0
                
            } completion: { (done) in
                if done {
                    self.menuState = .closed
                    DispatchQueue.main.async {
                        completion?()
                    }
                }
            }
        }
    }
}

extension ContainerViewController: MenuViewControllerDelegate {
    
    func didSelect(menuItem: MenuViewController.MenuOptions) {
        toggleMenu(completion: nil)
        switch menuItem {
        case .home:
            self.resetToHome()
        case .info:
            self.addInfo()
        }
    }
    
    func addInfo() {
        
        homeVC.addChild(infoVC)
        homeVC.view.addSubview(infoVC.view)
        infoVC.view.frame = view.frame
        infoVC.didMove(toParent: homeVC)
        homeVC.title = infoVC.title
        homeVC.label.text = ""
    }
    
    func resetToHome() {
        infoVC.view.removeFromSuperview()
        homeVC.title = "Home"
        homeVC.label.text = "this is the Home Screen."
    }
    
}

