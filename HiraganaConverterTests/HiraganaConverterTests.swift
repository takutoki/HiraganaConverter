//
//  HiraganaConverterTests.swift
//  HiraganaConverterTests
//
//  Created by takumitokiwa on 2019/09/04.
//  Copyright © 2019 takutoki. All rights reserved.
//

import XCTest
import RxSwift
@testable import HiraganaConverter

class HiraganaConverterTests: XCTestCase {
    
    var mockAPI: MockAPI!
    let disposeBag = DisposeBag()

    override func setUp() {
        super.setUp()
        self.mockAPI = MockAPI()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testVariableAPIResponseType() {
        let exp = expectation(description: "API wait...")
        mockAPI.get(path: "", parameters: nil)
            .subscribe(onNext: { response in
                print("MockAPIResponse: \(response)")
                XCTAssertEqual(response.url, "https://httpbin.org/get")
                exp.fulfill()
            }, onError: { error in
                XCTFail("MockAPIResponseError....\(error.localizedDescription)")
                exp.fulfill()
            })
            .disposed(by: disposeBag)
        
        waitForExpectations(timeout: 3) { errorHandler in
            if let error = errorHandler {
                XCTFail("ExpectaionTimeOut: \(error.localizedDescription)")
            }
        }
    }
}
