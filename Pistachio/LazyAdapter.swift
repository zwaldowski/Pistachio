//  Copyright (c) 2015 Felix Jendrusch. All rights reserved.

import Lustre

public struct LazyAdapter<A: AdapterType>: AdapterType {
    private let adapter: () -> A

    public init(@autoclosure(escaping) adapter: () -> A) {
        self.adapter = adapter
    }

    public func forwardTransform(value: A.ReverseTransformResult.Value) -> A.ForwardTransformResult {
        return adapter().forwardTransform(value)
    }

    public func reverseTransform(transformedValue: A.ForwardTransformResult.Value) -> A.ReverseTransformResult {
        return adapter().reverseTransform(transformedValue)
    }
}

// MARK: - Fix

public func fix<A: AdapterType>(f: LazyAdapter<A> -> A) -> A {
    return f(LazyAdapter(adapter: fix(f)))
}
