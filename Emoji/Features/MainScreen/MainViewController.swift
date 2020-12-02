//
//  MainViewController.swift
//  Emoji
//
//  Created by Luis Costa on 02/12/2020.
//

import UIKit

protocol MainViewcontrollerProtocol {
    
}

final class MainViewController: UIViewController {
    // MARK: - Properties
    
    
    // MARK: - Initializers
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        
    }
}
