//
//  APICredentials.swift
//  CoinbasePro
//
//  Created by Martin on 06/06/2018.
//  Copyright © 2018 Martin. All rights reserved.
//

import Foundation

struct APICredentials {
    let key: String
    let secret: String
    let phrase: String
    let baseURL: URL

    init(key: String, secret: String, phrase: String, baseURL: String? = nil) {
        self.key = key
        self.secret = secret
        self.phrase = phrase
        if let baseURL = baseURL {
            self.baseURL = URL(string: baseURL)!
        } else {
            self.baseURL = URL(string: "https://api-public.gdax.com")!
        }
    }

    func signedHeader(method: String, requestPath: String, body: String? = nil) -> [String: String] {
        let timeStamp = String(Int(Date().timeIntervalSince1970))
        let signature = timeStamp + method + requestPath + (body ?? "")
        let signatureSigned64 = signature.HMAC256Base64(withKey: self.secret.base64Decode()!)
        let header: [String: String] = ["CB-ACCESS-KEY": self.key,
                                        "CB-ACCESS-SIGN": signatureSigned64,
                                        "CB-ACCESS-TIMESTAMP": timeStamp,
                                        "CB-ACCESS-PASSPHRASE": self.phrase]
        return header
    }
}
