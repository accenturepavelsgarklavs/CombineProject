//
//  CombineViewController.swift
//  CombineProject
//
//  Created by pavels.garklavs on 16/03/2022.
//

import UIKit
import SnapKit

final class CombineViewController: UIViewController {
    
    private let registerView = RegisterView()

    private var viewModel: CombineViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupRegisterView()
    }
    
    func configure(viewModel: CombineViewModel) {
        self.viewModel = viewModel
    }

}

private extension CombineViewController {
    func setupRegisterView() {
        view.addSubview(registerView)
        
        registerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
