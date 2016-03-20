//  Copyright (c) 2015 Felix Jendrusch. All rights reserved.

import Foundation
import ValueTransformer

public struct NSNumberValueTransformers {
    public static func char() -> ReversibleValueTransformer<Int8, NSNumber> {
        return ReversibleValueTransformer(transformClosure: { value in
            NSNumber(char: value)
        }, reverseTransformClosure: { transformedValue in
            transformedValue.charValue
        })
    }

    public static func unsignedChar() -> ReversibleValueTransformer<UInt8, NSNumber> {
        return ReversibleValueTransformer(transformClosure: { value in
            NSNumber(unsignedChar: value)
        }, reverseTransformClosure: { transformedValue in
            transformedValue.unsignedCharValue
        })
    }

    public static func short() -> ReversibleValueTransformer<Int16, NSNumber> {
        return ReversibleValueTransformer(transformClosure: { value in
            NSNumber(short: value)
        }, reverseTransformClosure: { transformedValue in
            transformedValue.shortValue
        })
    }

    public static func unsignedShort() -> ReversibleValueTransformer<UInt16, NSNumber> {
        return ReversibleValueTransformer(transformClosure: { value in
            NSNumber(unsignedShort: value)
        }, reverseTransformClosure: { transformedValue in
            transformedValue.unsignedShortValue
        })
    }

    public static func int() -> ReversibleValueTransformer<Int32, NSNumber> {
        return ReversibleValueTransformer(transformClosure: { value in
            NSNumber(int: value)
        }, reverseTransformClosure: { transformedValue in
            transformedValue.intValue
        })
    }

    public static func unsignedInt() -> ReversibleValueTransformer<UInt32, NSNumber> {
        return ReversibleValueTransformer(transformClosure: { value in
            NSNumber(unsignedInt: value)
            }, reverseTransformClosure: { transformedValue in
                transformedValue.unsignedIntValue
        })
    }

    public static func long() -> ReversibleValueTransformer<Int, NSNumber> {
        return ReversibleValueTransformer(transformClosure: { value in
            NSNumber(long: value)
        }, reverseTransformClosure: { transformedValue in
            transformedValue.longValue
        })
    }

    public static func unsignedLong() -> ReversibleValueTransformer<UInt, NSNumber> {
        return ReversibleValueTransformer(transformClosure: { value in
            NSNumber(unsignedLong: value)
        }, reverseTransformClosure: { transformedValue in
            transformedValue.unsignedLongValue
        })
    }

    public static func longLong() -> ReversibleValueTransformer<Int64, NSNumber> {
        return ReversibleValueTransformer(transformClosure: { value in
            NSNumber(longLong: value)
        }, reverseTransformClosure: { transformedValue in
            transformedValue.longLongValue
        })
    }

    public static func unsignedLongLong() -> ReversibleValueTransformer<UInt64, NSNumber> {
        return ReversibleValueTransformer(transformClosure: { value in
            NSNumber(unsignedLongLong: value)
        }, reverseTransformClosure: { transformedValue in
            transformedValue.unsignedLongLongValue
        })
    }

    public static func float() -> ReversibleValueTransformer<Float, NSNumber> {
        return ReversibleValueTransformer(transformClosure: { value in
            NSNumber(float: value)
        }, reverseTransformClosure: { transformedValue in
            transformedValue.floatValue
        })
    }

    public static func double() -> ReversibleValueTransformer<Double, NSNumber> {
        return ReversibleValueTransformer(transformClosure: { value in
            NSNumber(double: value)
        }, reverseTransformClosure: { transformedValue in
            transformedValue.doubleValue
        })
    }

    public static func bool() -> ReversibleValueTransformer<Bool, NSNumber> {
        return ReversibleValueTransformer(transformClosure: { value in
            NSNumber(bool: value)
        }, reverseTransformClosure: { transformedValue in
            transformedValue.boolValue
        })
    }

    public static func integer() -> ReversibleValueTransformer<Int, NSNumber> {
        return ReversibleValueTransformer(transformClosure: { value in
            NSNumber(integer: value)
        }, reverseTransformClosure: { transformedValue in
            transformedValue.integerValue
        })
    }

    public static func unsignedInteger() -> ReversibleValueTransformer<UInt, NSNumber> {
        return ReversibleValueTransformer(transformClosure: { value in
            NSNumber(unsignedInteger: value)
        }, reverseTransformClosure: { transformedValue in
            transformedValue.unsignedIntegerValue
        })
    }
}
