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
    
    var hiraganaStream: Observable<String> { get }
    func convertRequest(sentence: String)
}

class HiraganaConverterViewModel: HiraganaConverterModelProtocol {
    
    var model: HiraganaConverterModelProtocol!
    var hiraganaStream: Observable<String> { return model.hiraganaStream }
    
    init(inject model: HiraganaConverterModelProtocol) {
        self.model = model
    }
    
    func convertRequest(sentence: String) {
        
    }
}
