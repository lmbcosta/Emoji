//
//  CommonButton.swift
//  Emoji
//
//  Created by Luis Costa on 02/12/2020.
//

import UIKit

final class CommonButton: UIButton {
    private let action: () -> Void
    
    init(title: String,
         action: @escaping () -> Void) {
        self.action = action
        super.init(frame: .zero)
        titleLabel?.font = .systemFont(ofSize: 12, weight: .bold)
        setTitle(title, for: .normal)
        setTitle(title, for: .highlighted)
        setTitleColor(.white, for: .normal)
        setTitleColor(UIColor.white.withAlphaComponent(0.6), for: .highlighted)
        backgroundColor = .brightBlue
        self.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    @objc private func buttonTapped() {
        action()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
