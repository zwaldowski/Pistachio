//  Copyright (c) 2015 Felix Jendrusch. All rights reserved.

import Quick
import Nimble

import Pistachio

class DictionaryAdapterSpec: QuickSpec {
    override func spec() {
        describe("A DictionaryAdapter") {
            let adapter = CounterAdapters.anyObject

            let value = Counter(count: 1)
            let dictionary = [ "count": 1 ] as [String: AnyObject]

            it("should transform a value") {
                expect { try (adapter.transform(value) as? [String: AnyObject])?["count"] as? Int } == 1
            }

            it("should reverse transform a value") {
                expect { try adapter.reverseTransform(dictionary) } == value
            }
        }
    }
}
