//
//  EmojiView.swift
//  Emoji
//
//  Created by Luis Costa on 02/12/2020.
//

import UIKit

final class EmojiView: UIView {
    // MARK: - Properties
    
    private let emojiImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.alpha = 0.0
        return view
    }()
    
    private let activityIndicatorView: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView()
        view.startAnimating()
        view.alpha = 0.0
        return view
    }()
    
    // MARK: - Initializer
    
    init() {
        super.init(frame: .zero)
        addSubsviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubsviews() {
        addSubview(emojiImageView)
        addSubview(activityIndicatorView)
    }
    
    private func setupConstraints() {
        emojiImageView.snp.makeConstraints({
            $0.edges.equalToSuperview()
        })
        
        activityIndicatorView.snp.makeConstraints({
            $0.center.equalToSuperview()
        })
    }
    
    func configure(with state: State) {
        switch state {
        case let.image(emoji):
            emojiImageView.image = emoji
            emojiImageView.alpha = 1.0
            activityIndicatorView.alpha = 0.0
        case .loading:
            emojiImageView.alpha = 0.0
            activityIndicatorView.alpha = 1.0
        }
    }
}

extension EmojiView {
    enum State {
        case image(UIImage)
        case loading
    }
}
