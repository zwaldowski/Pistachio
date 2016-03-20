//  Copyright (c) 2015 Felix Jendrusch. All rights reserved.

import Quick
import Nimble

import Pistachio

class LensExtensionsSpec: QuickSpec {
    override func spec() {
        describe("Mapped lenses") {
            let counter = Counter(count: 0)

            let mapped = CounterLenses.count.map(AnyObjectValueTransformers.int)

            it("should get values") {
                expect { try mapped.get(from: counter) as? Int } == 0
            }
            
            it("should set values") {
                expect { try mapped.set(2, within: counter).count } == 2
            }
        }
    }
}
