//
//  ViewController.swift
//  Weather_iPhone
//
//  Created by 이지석 on 2022/05/18.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .black
        
        configureNav()
    }


    
    // MARK: - Functions
    
    private func configureNav() {
        
        navigationItem.title = "날씨"

        navigationController?.navigationBar.scrollEdgeAppearance = navigationController?.navigationBar.standardAppearance
        navigationController?.navigationBar.isTranslucent = false
    }
    
}

