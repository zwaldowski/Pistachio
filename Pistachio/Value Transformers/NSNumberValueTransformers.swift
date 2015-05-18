//  Copyright (c) 2015 Felix Jendrusch. All rights reserved.

import Foundation

import Lustre
import ValueTransformer

public struct NSNumberValueTransformers {
    public static var char: ReversibleValueTransformer<ObjectResult<NSNumber>, AnyResult<Int8>> {
        return ReversibleValueTransformer(transformClosure: { value in
            return success(NSNumber(char: value))
        }, reverseTransformClosure: { transformedValue in
            return success(transformedValue.charValue)
        })
    }

    public static var unsignedChar: ReversibleValueTransformer<ObjectResult<NSNumber>, AnyResult<UInt8>> {
        return ReversibleValueTransformer(transformClosure: { value in
            return success(NSNumber(unsignedChar: value))
        }, reverseTransformClosure: { transformedValue in
            return success(transformedValue.unsignedCharValue)
        })
    }

    public static var short: ReversibleValueTransformer<ObjectResult<NSNumber>, AnyResult<Int16>> {
        return ReversibleValueTransformer(transformClosure: { value in
            return success(NSNumber(short: value))
        }, reverseTransformClosure: { transformedValue in
            return success(transformedValue.shortValue)
        })
    }

    public static var unsignedShort: ReversibleValueTransformer<ObjectResult<NSNumber>, AnyResult<UInt16>> {
        return ReversibleValueTransformer(transformClosure: { value in
            return success(NSNumber(unsignedShort: value))
        }, reverseTransformClosure: { transformedValue in
            return success(transformedValue.unsignedShortValue)
        })
    }

    public static var int: ReversibleValueTransformer<ObjectResult<NSNumber>, AnyResult<Int32>> {
        return ReversibleValueTransformer(transformClosure: { value in
            return success(NSNumber(int: value))
        }, reverseTransformClosure: { transformedValue in
            return success(transformedValue.intValue)
        })
    }

    public static var unsignedInt: ReversibleValueTransformer<ObjectResult<NSNumber>, AnyResult<UInt32>> {
        return ReversibleValueTransformer(transformClosure: { value in
            return success(NSNumber(unsignedInt: value))
        }, reverseTransformClosure: { transformedValue in
            return success(transformedValue.unsignedIntValue)
        })
    }

    public static var long: ReversibleValueTransformer<ObjectResult<NSNumber>, AnyResult<Int>> {
        return integer
    }

    public static var unsignedLong: ReversibleValueTransformer<ObjectResult<NSNumber>, AnyResult<UInt>> {
        return unsignedInteger
    }

    public static var longLong: ReversibleValueTransformer<ObjectResult<NSNumber>, AnyResult<Int64>> {
        return ReversibleValueTransformer(transformClosure: { value in
            return success(NSNumber(longLong: value))
        }, reverseTransformClosure: { transformedValue in
            return success(transformedValue.longLongValue)
        })
    }

    public static var unsignedLongLong: ReversibleValueTransformer<ObjectResult<NSNumber>, AnyResult<UInt64>> {
        return ReversibleValueTransformer(transformClosure: { value in
            return success(NSNumber(unsignedLongLong: value))
        }, reverseTransformClosure: { transformedValue in
            return success(transformedValue.unsignedLongLongValue)
        })
    }
    
    // MARK: Officially bridged

    public static var float: ReversibleValueTransformer<ObjectResult<NSNumber>, AnyResult<Float>> {
        return ReversibleValueTransformer(transformClosure: { value in
            return success(value as NSNumber)
        }, reverseTransformClosure: { transformedValue in
            return success(transformedValue as Float)
        })
    }

    public static var double: ReversibleValueTransformer<ObjectResult<NSNumber>, AnyResult<Double>> {
        return ReversibleValueTransformer(transformClosure: { value in
            return success(value as NSNumber)
        }, reverseTransformClosure: { transformedValue in
            return success(transformedValue as Double)
        })
    }

    public static var bool: ReversibleValueTransformer<ObjectResult<NSNumber>, AnyResult<Bool>> {
        return ReversibleValueTransformer(transformClosure: { value in
            return success(value as NSNumber)
        }, reverseTransformClosure: { transformedValue in
            return success(transformedValue as Bool)
        })
    }

    public static var integer: ReversibleValueTransformer<ObjectResult<NSNumber>, AnyResult<Int>> {
        return ReversibleValueTransformer(transformClosure: { value in
            return success(value as NSNumber)
        }, reverseTransformClosure: { transformedValue in
            return success(transformedValue as Int)
        })
    }

    public static var unsignedInteger: ReversibleValueTransformer<ObjectResult<NSNumber>, AnyResult<UInt>> {
        return ReversibleValueTransformer(transformClosure: { value in
            return success(value as NSNumber)
        }, reverseTransformClosure: { transformedValue in
            return success(transformedValue as UInt)
        })
    }
}
