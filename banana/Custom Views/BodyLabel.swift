//
//  BodyLabel.swift
//  banana
//
//  Created by Deniz on 4.06.2023.
//

import UIKit

class BodyLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    init(textAlignment: NSTextAlignment) {
        super.init(frame: .zero)
        self.textAlignment = textAlignment
        self.font = UIFont.preferredFont(forTextStyle: .footnote, compatibleWith: .none)
        configure()
    }
    
    
    private func configure() {
        textColor                   = .systemGray
        adjustsFontSizeToFitWidth   = true
        minimumScaleFactor          = 0.75
        lineBreakMode               = .byTruncatingTail
        translatesAutoresizingMaskIntoConstraints = false
    }
}
