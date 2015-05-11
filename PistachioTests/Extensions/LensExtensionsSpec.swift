//  Copyright (c) 2015 Felix Jendrusch. All rights reserved.

import Foundation

import Quick
import Nimble

import Lustre
import Monocle
import Pistachio

class LensExtensionsSpec: QuickSpec {
    override func spec() {
        describe("Lifted lenses") {
            context("for results") {
                let counter = Counter(count: 1)
                let error = NSError()

                let lifted: Lens<AnyResult<Counter>, AnyResult<Int>> = lift(CounterLenses.count)

                it("should get values") {
                    let result = get(lifted, success(counter))

                    expect(result.value).to(equal(1))
                }

                it("should return structure failures on get") {
                    let result = get(lifted, failure(error))

                    expect(result.error).to(beIdenticalTo(error))
                }

                it("should set values") {
                    let result = set(lifted, success(counter), success(1))

                    expect(result.value?.count).to(equal(1))
                }

                it("should return structure failures on set") {
                    let result = set(lifted, failure(error), success(1))

                    expect(result.error).to(beIdenticalTo(error))
                }

                it("should return value failures on set") {
                    let result = set(lifted, success(counter), failure(error))

                    expect(result.error).to(beIdenticalTo(error))
                }
            }
        }

        describe("Mapped lenses") {
            let counter = Counter(count: 0)
            
            let mapped = map(CounterLenses.count, AnyObjectValueTransformers.int)
            
            it("should get values") {
                let result = get(mapped, success(counter))
                
                expect(result.value as? Int).to(equal(0))
            }
            
            it("should set values") {
                let result = set(mapped, success(counter), success(2))
                
                expect(result.value?.count).to(equal(2))
            }
        }
    }
}
