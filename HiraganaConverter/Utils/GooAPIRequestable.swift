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
    
    func get(path: String, parameters: [String: String]?, onNext: @escaping (GooAPIResponse) -> ())
    func post(path: String, parameters: [String : String]?, onNext: @escaping (GooAPIResponse) -> ())
}

extension GooAPIRequestable {
    
    var requester = GooAPI()
    
    func get(path: String, parameters: [String: String]?, onNext: @escaping (GooAPIResponse) -> ()) {
        requester.get(path: path, parameters: parameters)
            .subscribe(onNext: onNext, onError: handleError)
            .disposed(by: disposeBag)
    }
    
    func post(path: String, parameters: [String : String]?, onNext: @escaping (GooAPIResponse) -> ()) {
        requester.post(path: path, parameter: parameters)
            .subscribe(onNext: onNext, onError: handleError)
            .disposed(by: disposeBag)
    }
    
    func handleError(error: Error) {
        print("GooAPIRequestable handleError: \(error.localizedDescription)")
    }
}
