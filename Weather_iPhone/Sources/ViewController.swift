//
//  ViewController.swift
//  Weather_iPhone
//
//  Created by 이지석 on 2022/05/18.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .black
        
        configureNav()
    }
    
    
    // MARK: - Selector
    
    @objc func handleMenu() {
        print("DEBUG: Nav Right button tapped")
    }


    
    // MARK: - Functions
    
    private func configureNav() {
        
        navigationItem.title = "날씨"

        navigationController?.navigationBar.scrollEdgeAppearance = navigationController?.navigationBar.standardAppearance
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.tintColor = .white
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "ellipsis.circle"), style: .plain, target: self, action: #selector(handleMenu))
    }
    
}

