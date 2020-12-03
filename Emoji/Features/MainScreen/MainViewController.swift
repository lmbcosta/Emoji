//
//  MainViewController.swift
//  Emoji
//
//  Created by Luis Costa on 02/12/2020.
//

import UIKit

protocol MainViewcontrollerProtocol {
    
}

final class MainViewController: UIViewController {
    // MARK: - Properties
    
    private let viewModel: MainViewModelProtocol
    private let navigator: EmojisNavigatorProtocol
    
    private lazy var mainView: MainView = {
        let actionForEmoji: () -> Void = { [weak self] in
            self?.viewModel.requestRandomEmoji()
            self?.mainView.emojiButtonView.configure(with: .loading)
        }
        let actionForEmpty: () -> Void = { [weak self] in
            self?.viewModel.requestEmojis()
            self?.mainView.emojiButtonView.configure(with: .loading)
        }
        let actionForEmojiList: () -> Void = { [weak self] in
            self?.navigator.navigateToEmojisList(from: self?.navigationController)
        }
        let actionForSearch: (String) -> Void = { [weak self] in
            self?.viewModel.requestUserAvatar(for: $0)
        }
        let actionForAvatars: () -> Void = { [weak self] in
            self?.navigator.navigateToAvatarsList(from: self?.navigationController)
        }
        let actionForRepos: () -> Void = { [weak self] in
            self?.navigator.navgateToAppleRepos(from: self?.navigationController)
        }
        
        let view = MainView(actionForEmoji: actionForEmoji,
                            actionForEmpty: actionForEmpty,
                            actionForEmojiList: actionForEmojiList,
                            actionForSearch: actionForSearch,
                            actionForAvatars: actionForAvatars,
                            actionForRepos: actionForRepos)
        return view
    }()
    
    // MARK: - Initializers
    
    init(viewModel: MainViewModelProtocol,
         navigator: EmojisNavigatorProtocol) {
        self.viewModel = viewModel
        self.navigator = navigator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = mainView
    }
}
