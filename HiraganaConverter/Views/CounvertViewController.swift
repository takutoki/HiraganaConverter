//
//  CounvertViewController.swift
//  HiraganaConverter
//
//  Created by takumitokiwa on 2019/09/09.
//  Copyright © 2019 takutoki. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class CounvertViewController: UIViewController {
    
    @IBOutlet weak var kanjiLabel: UILabel!
    @IBOutlet weak var kanjiTextView: UITextView!
    @IBOutlet weak var clearButton: UIButton!
    @IBOutlet weak var hiraganaTextView: UITextView!
    
    @IBOutlet weak var scrollWidth: NSLayoutConstraint!
    @IBOutlet weak var scrollHeight: NSLayoutConstraint!
    
    let disposeBag = DisposeBag()
    var navBarHeight: CGFloat { return navigationController?.navigationBar.frame.size.height ?? 0 }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initAll()
        bindAll()
    }
    
    private func initAll() {
        initNavigation()
        initScrollView()
        initView()
    }
    
    private func bindAll() {
        bindClearButton()
    }
    
    private func initNavigation() {
        navigationController?.navigationBar.defaultSetting()
        navigationItem.title = "ひらがな変換"
    }
    
    private func initScrollView() {
        scrollWidth.constant = UIScreen.main.bounds.width
        scrollHeight.constant = UIScreen.main.bounds.height - navBarHeight
    }
    
    private func initView() {
        kanjiLabel.text = "漢字　→　ひらがな"
        kanjiLabel.font = UIFont(name: "AppleSDGothicNeo-Medium", size: 20)
        kanjiTextView.text = ""
        kanjiTextView.defaultBorder()
        kanjiTextView.returnKeyType = .go
        clearButton.setImage(UIImage(named: "clear"), for: .normal)
        clearButton.setTitle("", for: .normal)
        clearButton.tintColor = .black
        clearButton.imageView?.clipsToBounds = true
        clearButton.imageView?.contentMode = .scaleAspectFill
        hiraganaTextView.text = ""
        hiraganaTextView.defaultBorder()
        hiraganaTextView.textColor = .white
        hiraganaTextView.backgroundColor = .blue
        hiraganaTextView.isEditable = false
    }
    
    private func bindClearButton() {
        clearButton.rx.tap
            .subscribe(clearBinder)
            .disposed(by: disposeBag)
    }
    
    private var clearBinder: Binder<()> {
        return Binder(self) { base, _ in
            base.kanjiTextView.text = ""
            base.hiraganaTextView.text = ""
        }
    }
}
