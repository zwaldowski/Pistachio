//  Copyright (c) 2015 Felix Jendrusch. All rights reserved.

public struct LazyAdapter<A: AdapterType>: AdapterType {
    private let adapter: () -> A

    public init(@autoclosure(escaping) adapter: () -> A) {
        self.adapter = adapter
    }

    public func transform(value: A.OriginalValue) throws -> A.TransformedValue {
        return try adapter().transform(value)
    }

    public func reverseTransform(transformedValue: A.TransformedValue) throws -> A.OriginalValue {
        return try adapter().reverseTransform(transformedValue)
    }
}

// MARK: - Fix

public func fix<A: AdapterType>(f: LazyAdapter<A> -> A) -> A {
    return f(LazyAdapter(adapter: fix(f)))
}
