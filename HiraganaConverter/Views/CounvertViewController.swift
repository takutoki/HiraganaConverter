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
    @IBOutlet weak var convertButton: UIButton!
    @IBOutlet weak var hiraganaTextView: UITextView!
    
    let viewModel: HiraganaConverterViewModelProtocol!
    let disposeBag = DisposeBag()
    
    init(inject viewModel: HiraganaConverterViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initAll()
        bindAll()
    }
    
    private func initAll() {
        initNavigation()
        initView()
    }
    
    private func bindAll() {
        bindClearButton()
        bindConvertButton()
        bindHiraganaText()
    }
    
    private func initNavigation() {
        navigationController?.navigationBar.defaultSetting()
        navigationItem.title = "ひらがな変換"
    }

    private func initView() {
        kanjiLabel.text = "漢字　→　ひらがな"
        kanjiLabel.font = UIFont(name: "ヒラギノ明朝ProN W6", size: 20)
        kanjiTextView.text = ""
        kanjiTextView.defaultBorder()
        kanjiTextView.returnKeyType = .go
        clearButton.setImage(UIImage(named: "clear"), for: .normal)
        clearButton.setTitle("", for: .normal)
        clearButton.tintColor = .black
        clearButton.imageView?.clipsToBounds = true
        clearButton.imageView?.contentMode = .scaleAspectFill
        convertButton.setTitle("変換", for: .normal)
        convertButton.titleLabel?.font = UIFont(name: "ヒラギノ明朝ProN W6", size: 20)
        convertButton.setTitleColor(.white, for: .normal)
        convertButton.backgroundColor = .dodgerBlue
        convertButton.layer.masksToBounds = true
        convertButton.layer.cornerRadius = convertButton.frame.width / 2
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
    
    private func bindConvertButton() {
        convertButton.rx.tap
            .map{ [weak self] _ in self?.kanjiTextView.text ?? "" }
            .filter{ $0 != "" }
            .bind(to: viewModel.convertBinder)
            .disposed(by: disposeBag)
    }
    
    private func bindHiraganaText() {
        viewModel.hiraganaStream
            .bind(to: hiraganaTextView.rx.text)
            .disposed(by: disposeBag)
    }
}
