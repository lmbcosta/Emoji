//
//  MainView.swift
//  Emoji
//
//  Created by Luis Costa on 02/12/2020.
//

import UIKit
import SnapKit

final class MainView: UIView {
    // MARK: Properties
    
    private let actionForEmoji: () -> Void
    private let actionForEmpty: () -> Void
    private let actionForEmojiList: () -> Void
    private let actionForSearch: (String) -> Void
    private let actionForAvatars: () -> Void
    private let actionForRepos: () -> Void
    
    let emojiView = EmojiView()
    
    lazy var emojiButtonView: EmojiButtonView = {
        let view = EmojiButtonView(actionForEmoji: actionForEmoji,
                                   actionForEmpty: actionForEmpty,
                                   state: .empty(title: Strings.getEmoji))
        return view
    }()
    
    lazy var emojiListButton = CommonButton(title: Strings.emojisList,
                                            action: actionForEmojiList)
    
    let searchView = UIView()
    
    let searchBar: UISearchBar = {
        let bar = UISearchBar()
        bar.placeholder = Strings.searchAvatars
        bar.layer.borderWidth = 1.0
        bar.layer.backgroundColor = UIColor.brightBlue.cgColor
        return bar
    }()
    
    lazy var searchButton =
        CommonButton(title: Strings.search,
                     action: { [weak self] in
                        let text = self?.searchBar.text ?? ""
                        self?.actionForSearch(text)
                     })
    
    lazy var avatarListButton  = CommonButton(title: Strings.avatarList,
                                              action: actionForAvatars)
    
    lazy var reposButton = CommonButton(title: Strings.repos,
                                        action: actionForRepos)
    
    let stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = Dimensions.stackViewSpacing
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
         actionForSearch: @escaping (String) -> Void,
         actionForAvatars: @escaping () -> Void,
         actionForRepos: @escaping () -> Void) {
        self.actionForEmoji = actionForEmoji
        self.actionForEmpty = actionForEmpty
        self.actionForEmojiList = actionForEmojiList
        self.actionForSearch = actionForSearch
        self.actionForAvatars = actionForAvatars
        self.actionForRepos = actionForRepos
        super.init(frame: .zero)
        addSubsviews()
        setupConstraints()
        backgroundColor = .white
        
        emojiButtonView.configure(with: .empty(title: Strings.getEmoji))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubsviews() {
        addSubview(emojiView)
        addSubview(emojiButtonView)
        searchView.addSubview(searchBar)
        searchView.addSubview(searchButton)
        stackView.addArrangedSubview(emojiButtonView)
        stackView.addArrangedSubview(emojiListButton)
        stackView.addArrangedSubview(feedbackLabel)
        stackView.addArrangedSubview(searchView)
        stackView.addArrangedSubview(avatarListButton)
        stackView.addArrangedSubview(reposButton)
        addSubview(stackView)
    }
    
    private func setupConstraints() {
        emojiView.snp.makeConstraints({
            $0.size.equalTo(Dimensions.emojiSize)
            $0.top.equalTo(safeAreaLayoutGuide.snp.top).inset(Dimensions.emojiTopInset)
            $0.centerX.equalToSuperview()
        })
        
        emojiButtonView.snp.makeConstraints({
            $0.height.equalTo(Dimensions.buttonHeight)
        })
        
        emojiListButton.snp.makeConstraints({
            $0.height.equalTo(Dimensions.buttonHeight)
        })
        
        avatarListButton.snp.makeConstraints({
            $0.height.equalTo(Dimensions.buttonHeight)
        })
        
        reposButton.snp.makeConstraints({
            $0.height.equalTo(Dimensions.buttonHeight)
        })
        	
        searchButton.snp.makeConstraints({
            $0.top.trailing.bottom.equalToSuperview()
            $0.width.equalTo(Dimensions.searchWidth)
        })
        
        searchBar.snp.makeConstraints({
            $0.top.leading.bottom.equalToSuperview()
            $0.trailing.equalTo(searchButton.snp.leading).offset(-Dimensions.searchSpacing)
        })
        
        searchView.snp.makeConstraints({
            $0.height.equalTo(Dimensions.searchHeight)
        })
        
        stackView.snp.makeConstraints({
            $0.leading.trailing.equalToSuperview().inset(Dimensions.stackViewHorizontalInser)
            $0.bottom.equalToSuperview().inset(Dimensions.stackViewBottomInset)
        })
    }
}

extension MainView {
    struct Strings {
        static let getEmoji = "Get Emoji"
        static let randomEmoji = "Random Emoji"
        static let searchAvatars = "Search for Avatars"
        static let emojisList = "Emojis List"
        static let avatarList = "Avatar List"
        static let search = "Search"
        static let repos = "Apple Repos"
    }
    
    struct Dimensions {
        static let emojiTopInset: CGFloat = 40.0
        static let emojiSize: CGSize = .init(width: 300, height: 300)
        static let searchSpacing: CGFloat = 12.0
        static let searchHeight: CGFloat = 40.0
        static let searchWidth: CGFloat = 80.0
        static let stackViewSpacing: CGFloat = 12.0
        static let stackViewHorizontalInser: CGFloat = 20.0
        static let stackViewBottomInset: CGFloat = 100.0
        static let buttonHeight: CGFloat = 40.0
    }
}
