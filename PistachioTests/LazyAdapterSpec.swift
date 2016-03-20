//  Copyright (c) 2015 Felix Jendrusch. All rights reserved.

import Quick
import Nimble

import Pistachio

class LazyAdapterSpec: QuickSpec {
    override func spec() {
        describe("A LazyAdapter") {
            let adapter = NodeAdapters.anyObject

            let value = Node(children: [ Node(children: []) ])
            let dictionary = [ "count": 1 ] as [String: AnyObject]


            it("should transform a value") {
                expect { try ((adapter.transform(value) as? [String: AnyObject])?["children"] as? [AnyObject])?.count } == 1
            }

            it("should reverse transform a value") {
                expect { try adapter.reverseTransform([ "children": [ [ "children": [] ] ] ]) } == value
            }
        }
    }
}
