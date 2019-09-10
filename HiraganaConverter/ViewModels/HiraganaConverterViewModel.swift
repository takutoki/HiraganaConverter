//
//  HiraganaConverterViewModel.swift
//  HiraganaConverter
//
//  Created by takumitokiwa on 2019/09/09.
//  Copyright © 2019 takutoki. All rights reserved.
//

import RxSwift
import RxCocoa

protocol HiraganaConverterViewModelProtocol: AnyObject {
    
    var model: HiraganaConverterModelProtocol! { get }
    var hiraganaStream: Observable<String> { get }
    var convertBinder: Binder<String> { get }
}

class HiraganaConverterViewModel: HiraganaConverterViewModelProtocol {

    var model: HiraganaConverterModelProtocol!
    var hiraganaStream: Observable<String> { return model.hiraganaStream }
    
    init(inject model: HiraganaConverterModelProtocol) {
        self.model = model
    }
    
    var convertBinder: Binder<String> {
        return Binder(self) { base, sentence in
            base.convertRequest(sentence: sentence)
        }
    }
    
    private func convertRequest(sentence: String) {
        model.convertRequest(sentence: sentence)
    }
}
