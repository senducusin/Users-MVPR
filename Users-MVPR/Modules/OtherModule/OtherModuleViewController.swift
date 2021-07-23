//
//  OtherModuleViewController.swift
//  Users-MVPR
//
//  Created by Jansen Ducusin on 7/23/21.
//

import UIKit

protocol OtherModuleViewControllerProtocol: AnyObject{
    var otherModulePresenterProtocol: OtherModulePresenterProtocol? {get set}
}

class OtherModuleViewController: UIViewController, OtherModuleViewControllerProtocol{
    // MARK: - Properties
    var otherModulePresenterProtocol: OtherModulePresenterProtocol?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    // MARK: - Selectors
    @objc private func cancelButtonDidTap(){
        otherModulePresenterProtocol?.cancelDidTap()
    }
    
    // MARK: - Helpers
    private func setupUI(){
        view.backgroundColor = .white
        
        title = "Other Module"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelButtonDidTap))
    }
}
