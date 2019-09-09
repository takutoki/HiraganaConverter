//
//  HiraganaConverterModel.swift
//  HiraganaConverter
//
//  Created by takumitokiwa on 2019/09/09.
//  Copyright © 2019 takutoki. All rights reserved.
//

import RxSwift
import RxCocoa

protocol HiraganaConverterModelProtocol: AnyObject {
    
    var hiraganaStream: Observable<String> { get }
    func convertRequest(sentence: String)
}

class HiraganaConverterModel: HiraganaConverterModelProtocol {
    
    private let hiraganaText: BehaviorRelay<String> = BehaviorRelay(value: "")
    var hiraganaStream: Observable<String> { return hiraganaText.asObservable()}
    
    init() {}
    
    func convertRequest(sentence: String) {
        
    }
}
