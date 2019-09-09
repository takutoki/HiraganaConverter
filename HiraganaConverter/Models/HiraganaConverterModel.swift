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
    
    var hiraganaText: BehaviorRelay<String> { get set }
    var hiraganaStream: Observable<String> { get }
    
    func request(sentence: String)
}

class HiraganaConverterModel: HiraganaConverterModelProtocol {
    
    var hiraganaText: BehaviorRelay<String> = BehaviorRelay(value: "")
    var hiraganaStream: Observable<String> { return hiraganaText.asObservable()}
    
    init() {}
    
    func request(sentence: String) {
        
    }
}
