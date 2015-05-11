//  Copyright (c) 2015 Felix Jendrusch. All rights reserved.

import Foundation

import Lustre
import ValueTransformer

public struct NSNumberValueTransformers {
    public static func char() -> ReversibleValueTransformer<Int8, ObjectResult<NSNumber>, AnyResult<Int8>> {
        return ReversibleValueTransformer(transformClosure: { value in
            return success(NSNumber(char: value))
        }, reverseTransformClosure: { transformedValue in
            return success(transformedValue.charValue)
        })
    }

    public static func unsignedChar() -> ReversibleValueTransformer<UInt8, ObjectResult<NSNumber>, AnyResult<UInt8>> {
        return ReversibleValueTransformer(transformClosure: { value in
            return success(NSNumber(unsignedChar: value))
        }, reverseTransformClosure: { transformedValue in
            return success(transformedValue.unsignedCharValue)
        })
    }

    public static func short() -> ReversibleValueTransformer<Int16, ObjectResult<NSNumber>, AnyResult<Int16>> {
        return ReversibleValueTransformer(transformClosure: { value in
            return success(NSNumber(short: value))
        }, reverseTransformClosure: { transformedValue in
            return success(transformedValue.shortValue)
        })
    }

    public static func unsignedShort() -> ReversibleValueTransformer<UInt16, ObjectResult<NSNumber>, AnyResult<UInt16>> {
        return ReversibleValueTransformer(transformClosure: { value in
            return success(NSNumber(unsignedShort: value))
        }, reverseTransformClosure: { transformedValue in
            return success(transformedValue.unsignedShortValue)
        })
    }

    public static func int() -> ReversibleValueTransformer<Int32, ObjectResult<NSNumber>, AnyResult<Int32>> {
        return ReversibleValueTransformer(transformClosure: { value in
            return success(NSNumber(int: value))
        }, reverseTransformClosure: { transformedValue in
            return success(transformedValue.intValue)
        })
    }

    public static func unsignedInt() -> ReversibleValueTransformer<UInt32, ObjectResult<NSNumber>, AnyResult<UInt32>> {
        return ReversibleValueTransformer(transformClosure: { value in
            return success(NSNumber(unsignedInt: value))
            }, reverseTransformClosure: { transformedValue in
                return success(transformedValue.unsignedIntValue)
        })
    }

    public static func long() -> ReversibleValueTransformer<Int, ObjectResult<NSNumber>, AnyResult<Int>> {
        return ReversibleValueTransformer(transformClosure: { value in
            return success(NSNumber(long: value))
        }, reverseTransformClosure: { transformedValue in
            return success(transformedValue.longValue)
        })
    }

    public static func unsignedLong() -> ReversibleValueTransformer<UInt, ObjectResult<NSNumber>, AnyResult<UInt>> {
        return ReversibleValueTransformer(transformClosure: { value in
            return success(NSNumber(unsignedLong: value))
        }, reverseTransformClosure: { transformedValue in
            return success(transformedValue.unsignedLongValue)
        })
    }

    public static func longLong() -> ReversibleValueTransformer<Int64, ObjectResult<NSNumber>, AnyResult<Int64>> {
        return ReversibleValueTransformer(transformClosure: { value in
            return success(NSNumber(longLong: value))
        }, reverseTransformClosure: { transformedValue in
            return success(transformedValue.longLongValue)
        })
    }

    public static func unsignedLongLong() -> ReversibleValueTransformer<UInt64, ObjectResult<NSNumber>, AnyResult<UInt64>> {
        return ReversibleValueTransformer(transformClosure: { value in
            return success(NSNumber(unsignedLongLong: value))
        }, reverseTransformClosure: { transformedValue in
            return success(transformedValue.unsignedLongLongValue)
        })
    }

    public static func float() -> ReversibleValueTransformer<Float, ObjectResult<NSNumber>, AnyResult<Float>> {
        return ReversibleValueTransformer(transformClosure: { value in
            return success(NSNumber(float: value))
        }, reverseTransformClosure: { transformedValue in
            return success(transformedValue.floatValue)
        })
    }

    public static func double() -> ReversibleValueTransformer<Double, ObjectResult<NSNumber>, AnyResult<Double>> {
        return ReversibleValueTransformer(transformClosure: { value in
            return success(NSNumber(double: value))
        }, reverseTransformClosure: { transformedValue in
            return success(transformedValue.doubleValue)
        })
    }

    public static func bool() -> ReversibleValueTransformer<Bool, ObjectResult<NSNumber>, AnyResult<Bool>> {
        return ReversibleValueTransformer(transformClosure: { value in
            return success(NSNumber(bool: value))
        }, reverseTransformClosure: { transformedValue in
            return success(transformedValue.boolValue)
        })
    }

    public static func integer() -> ReversibleValueTransformer<Int, ObjectResult<NSNumber>, AnyResult<Int>> {
        return ReversibleValueTransformer(transformClosure: { value in
            return success(NSNumber(integer: value))
        }, reverseTransformClosure: { transformedValue in
            return success(transformedValue.integerValue)
        })
    }

    public static func unsignedInteger() -> ReversibleValueTransformer<Int, ObjectResult<NSNumber>, AnyResult<Int>> {
        return ReversibleValueTransformer(transformClosure: { value in
            return success(NSNumber(unsignedInteger: value))
        }, reverseTransformClosure: { transformedValue in
            return success(transformedValue.unsignedIntegerValue)
        })
    }
}
