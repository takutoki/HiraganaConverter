//
//  GooAPIRequestable.swift
//  HiraganaConverter
//
//  Created by takumitokiwa on 2019/09/10.
//  Copyright © 2019 takutoki. All rights reserved.
//

import RxSwift

protocol GooAPIRequestable {
    
    var disposeBag: DisposeBag { get }
    var requester: GooAPI { get }
    
    func post(path: String, parameters: [String : Any]?, onNext: @escaping (GooAPIResponse) -> ())
}

extension GooAPIRequestable {
    
    func post(path: String, parameters: [String : Any]?, onNext: @escaping (GooAPIResponse) -> ()) {
        requester.post(path: path, parameter: parameters)
            .subscribe(onNext: onNext, onError: handleError)
            .disposed(by: disposeBag)
    }
    
    func handleError(error: Error) {
        print("GooAPIRequestable handleError: \(error.localizedDescription)")
    }
}
