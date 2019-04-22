//
//  Word.swift
//  EasyDictrionary
//
//  Created by Андрей Беляев on 20/04/2019.
//  Copyright © 2019 Андрей Беляев. All rights reserved.
//

import Foundation
import UIKit

struct CurrentWord{
    let word: String
    let transcription: String
    let translations: [String]
    //let synonims: [String]
}

extension CurrentWord: JSONDecodable {
    init?(JSON: [AnyObject]) {
        guard let word = JSON[
    }
}
