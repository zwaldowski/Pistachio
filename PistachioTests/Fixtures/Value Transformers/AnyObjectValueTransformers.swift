//  Copyright (c) 2015 Felix Jendrusch. All rights reserved.

import Foundation
import ValueTransformer

struct AnyObjectValueTransformers {
    enum Error: ErrorType {
        case CouldNotBridge(type: Any.Type)
    }

    static let int = ReversibleValueTransformer<Int, AnyObject>(transformClosure: { value in
        return value
    }, reverseTransformClosure: { transformedValue in
        guard let value = transformedValue as? Int else {
            throw Error.CouldNotBridge(type: transformedValue.dynamicType)
        }
        return value
    })

    static let array = ReversibleValueTransformer<[AnyObject], AnyObject>(transformClosure: { value in
        return value
    }, reverseTransformClosure: { transformedValue in
        guard let value = transformedValue as? [AnyObject] else {
            throw Error.CouldNotBridge(type: transformedValue.dynamicType)
        }
        return value
    })

    static let dictionary = ReversibleValueTransformer<[String: AnyObject], AnyObject>(transformClosure: { value in
        return value
    }, reverseTransformClosure: { transformedValue in
        guard let value = transformedValue as? [String: AnyObject] else {
            throw Error.CouldNotBridge(type: transformedValue.dynamicType)
        }
        return value
    })
}
