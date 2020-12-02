//
//  MainView.swift
//  Emoji
//
//  Created by Luis Costa on 02/12/2020.
//

import UIKit
import SnapKit

extension MainView {
    struct Strings {
        static let getEmoji = "Get Emoji"
        static let randomEmoji = "Random Emoji"
    }
}

final class MainView: UIView {
    // MARK: Properties
    
    private let actionForEmoji: () -> Void
    private let actionForEmpty: () -> Void
    private let actionForEmojiList: () -> Void
    private let actionForSearch: (String) -> Void
    
    let emojiView = EmojiView()
    
    lazy var emojiButtonView: EmojiButtonView = {
        let view = EmojiButtonView(actionForEmoji: actionForEmoji,
                                   actionForEmpty: actionForEmpty)
        view.configure(with: .empty(title: Strings.getEmoji))
        return view
    }()
    
    lazy var emojiListButton: CommonButton = {
        let button = CommonButton(title: "Emojis List",
                                  action: actionForEmojiList)
        return button
    }()
    
    let searchView = UIView()
    
    let searchBar: UISearchBar = {
        let bar = UISearchBar()
        bar.barTintColor = .brightBlue
        bar.placeholder = "Search for Avatars"
        return bar
    }()
    
    lazy var searchButtonView =
        CommonButton(title: "Search",
                     action: { [weak self] in
                        let text = self?.searchBar.text ?? ""
                        self?.actionForSearch(text)
                     })
    
    let stackView: UIStackView = {
        let view = UIStackView()
        return view
    }()
    
    let feedbackLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textAlignment = .center
        return label
    }()
    
    // MARK: Initializer
    
    init(actionForEmoji: @escaping () -> Void,
         actionForEmpty: @escaping () -> Void,
         actionForEmojiList: @escaping () -> Void,
         actionForSearch: @escaping (String) -> Void) {
        self.actionForEmoji = actionForEmoji
        self.actionForEmpty = actionForEmpty
        self.actionForEmojiList = actionForEmojiList
        self.actionForSearch = actionForSearch
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
