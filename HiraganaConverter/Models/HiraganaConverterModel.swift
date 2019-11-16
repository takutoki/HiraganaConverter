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

class HiraganaConverterModel: HiraganaConverterModelProtocol, GooAPIRequestable {
    
    var disposeBag: DisposeBag = DisposeBag()
    let path: String = "/api/hiragana"
    
    private let hiraganaText: BehaviorRelay<String> = BehaviorRelay(value: "")
    var hiraganaStream: Observable<String> { return hiraganaText.asObservable()}
    
    init() {}
    
    func convertRequest(sentence: String) {
        post(path: path, parameters: setParameter(sentence), onNext: onNext)
    }
    
    func setParameter(_ sentence: String) -> [String: String] {
        return [
            "sentence" : sentence,
            "output_type" : "hiragana"
        ]
    }
    
    func onNext(response: Codable) -> () {
        guard let gooApiResponse = response as? GooAPIResponse else { return }
        hiraganaText.accept(gooApiResponse.converted)
    }
}
