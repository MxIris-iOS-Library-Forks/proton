//
//  GenericViewTestViewController.swift
//  ProtonTests
//
//  Created by Rajdeep Kwatra on 5/6/2022.
//  Copyright © 2022 Rajdeep Kwatra. All rights reserved.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

import Foundation
import UIKit

import Proton

class GenericViewTestViewController: SnapshotTestViewController {
    let contentView: UIView

    init(contentView: UIView, backgroundColor: UIColor = .white) {
        self.contentView = contentView
        super.init(nibName: nil, bundle: nil)
        self.view.backgroundColor = backgroundColor
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addBorder()

        view.addSubview(contentView)
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ])
    }
}
