//
//  AutogrowingTextView.swift
//  Proton
//
//  Created by Rajdeep Kwatra on 31/12/19.
//  Copyright © 2019 Rajdeep Kwatra. All rights reserved.
//

import Foundation
import UIKit

class AutogrowingTextView: UITextView {

    var maxHeight: CGFloat = 0 {
        didSet {
            guard maxHeight > 0 else {
                maxHeightConstraint.isActive = false
                return
            }

            maxHeightConstraint.constant = maxHeight
            maxHeightConstraint.isActive = true
        }
    }

    weak var boundsObserver: BoundsObserving?
    var maxHeightConstraint: NSLayoutConstraint!

    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        maxHeightConstraint = heightAnchor.constraint(lessThanOrEqualToConstant: frame.height)
        isScrollEnabled = false
        NSLayoutConstraint.activate([
            heightAnchor.constraint(greaterThanOrEqualToConstant: frame.height)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        let bounds = self.bounds
        let fittingSize = sizeThatFits(CGSize(width: frame.width, height: .greatestFiniteMagnitude))
        isScrollEnabled = (fittingSize.height > bounds.height) || (maxHeight > 0 && maxHeight < fittingSize.height)
    }

    override var bounds: CGRect {
        didSet {
            guard oldValue.height != bounds.height else { return }
            boundsObserver?.didChangeBounds(bounds)
        }
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.becomeFirstResponder()
    }
}