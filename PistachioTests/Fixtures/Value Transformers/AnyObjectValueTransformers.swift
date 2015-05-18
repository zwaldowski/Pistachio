//  Copyright (c) 2015 Felix Jendrusch. All rights reserved.

import Foundation

import Lustre
import ValueTransformer

struct AnyObjectValueTransformers {
    static let int = ReversibleValueTransformer<ObjectResult<AnyObject>, AnyResult<Int>>(transformClosure: { value in
        success(value)
    }, reverseTransformClosure: { transformedValue in
        switch transformedValue {
        case let transformedValue as Int:
            return success(transformedValue)
        default:
            return failure()
        }
    })

    static let array = ReversibleValueTransformer<ObjectResult<AnyObject>, AnyResult<[AnyObject]>>(transformClosure: { value in
        success(value)
    }, reverseTransformClosure: { transformedValue in
        switch transformedValue {
        case let transformedValue as [AnyObject]:
            return success(transformedValue)
        default:
            return failure()
        }
    })

    static let dictionary = ReversibleValueTransformer<ObjectResult<AnyObject>, AnyResult<[String: AnyObject]>>(transformClosure: { value in
        return success(value)
    }, reverseTransformClosure: { transformedValue in
        switch transformedValue {
        case let transformedValue as [String: AnyObject]:
            return success(transformedValue)
        default:
            return failure()
        }
    })
}
