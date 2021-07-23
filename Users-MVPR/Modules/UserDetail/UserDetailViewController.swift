//
//  UserDetailViewControl.swift
//  Users-MVPR
//
//  Created by Jansen Ducusin on 7/23/21.
//

import UIKit

protocol UserDetailViewControlProtocol: AnyObject {
    var userDetailPresenterProtocol: UserDetailPresenterProtocol? {get set}
}

class UserDetailViewController: UIViewController, UserDetailViewControlProtocol {
    // MARK: - Properties
    var userDetailPresenterProtocol: UserDetailPresenterProtocol?
    
    lazy var toOtherModuleButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("To Other Module", for: .normal)
        button.addTarget(self, action: #selector(toOtherModuleButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    // MARK: - Selectors
    @objc private func cancelButtonDidTap(){
        userDetailPresenterProtocol?.cancelDidTap()
    }
    
    @objc private func toOtherModuleButtonDidTap(){
        userDetailPresenterProtocol?.toOtherModule()
    }
    
    // MARK: - Helpers
    private func setupUI(){
        view.backgroundColor = .white
        
        title = userDetailPresenterProtocol?.user?.name
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelButtonDidTap))
        
        view.addSubview(toOtherModuleButton)
        toOtherModuleButton.centerX(inView: view)
        toOtherModuleButton.centerY(inView: view)
    }
}
