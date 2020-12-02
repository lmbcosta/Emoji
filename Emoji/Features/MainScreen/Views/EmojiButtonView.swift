//
//  EmojiButtonView.swift
//  Emoji
//
//  Created by Luis Costa on 02/12/2020.
//

import UIKit

final class EmojiButtonView: UIView {
    // MARK: - Properties
    
    private let actionForEmoji: () -> Void
    private let actionForEmpty: () -> Void
    private var state: State = .loading
    
    private let button: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(UIColor.white.withAlphaComponent(0.6), for: .highlighted)
        button.backgroundColor = .brightBlue
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()
    
    private let activityIndicatorView: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView()
        view.color = .white
        view.startAnimating()
        view.color = .brightBlue
        view.alpha = 0.0
        return view
    }()
    
    // MARK: - Initializer
    
    init(actionForEmoji: @escaping () -> Void,
         actionForEmpty: @escaping () -> Void) {
        self.actionForEmoji = actionForEmoji
        self.actionForEmpty = actionForEmpty
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with state: State) {
        switch state {
        case let .emoji(title):
            button.setTitle(title, for: .normal)
            button.setTitle(title, for: .highlighted)
            button.alpha = 1.0
            activityIndicatorView.alpha = 0.0
            isUserInteractionEnabled = true
        case let .empty(title):
            button.setTitle(title, for: .normal)
            button.setTitle(title, for: .highlighted)
            button.alpha = 1.0
            activityIndicatorView.alpha = 0.0
            isUserInteractionEnabled = true
        case .loading:
            button.alpha = 0.0
            activityIndicatorView.alpha = 1.0
            isUserInteractionEnabled = false
        }
    }
    
    private func addSubViews() {
        addSubview(button)
        addSubview(activityIndicatorView)
    }
    
    private func setupConstraints() {
        button.snp.makeConstraints({
            $0.edges.equalToSuperview()
        })
        
        activityIndicatorView.snp.makeConstraints({
            $0.center.equalToSuperview()
        })
    }
    
    @objc private func buttonTapped() {
        switch state {
        case .empty:
            configure(with: .loading)
            actionForEmpty()
            
        case .emoji:
            configure(with: .loading)
            actionForEmoji()
        
        default: return
        }
    }
}

extension EmojiButtonView {
    enum State {
        case empty(title: String)
        case loading
        case emoji(title: String)
    }
}
