//  Copyright (c) 2015 Felix Jendrusch. All rights reserved.

import Lustre
import ValueTransformer
import Monocle

// MARK: - Lift

public func lift<A: ResultType, B: ResultType>(lens: Lens<A.Value, B.Value>) -> Lens<A, B> {
    func get(a: A) -> B {
        return a.map(Monocle.get(lens))
    }
    
    func set(a: A, b: B) -> A {
        return a.flatMap { a in b.map { b in Monocle.set(lens, a, b) } }
    }

    return Lens(get: get, set: set)
}

// MARK: - Map

public func map<R: ResultType, V: ReversibleValueTransformerType>(lens: Lens<R.Value, V.ReverseTransformResult.Value>, reversibleValueTransformer: V) -> Lens<R, V.ForwardTransformResult> {
    return map(lift(lens), reversibleValueTransformer)
}

public func map<R: ResultType, V: ReversibleValueTransformerType>(lens: Lens<R, V.ReverseTransformResult>, reversibleValueTransformer: V) -> Lens<R, V.ForwardTransformResult> {
    func get(a: R) -> V.ForwardTransformResult {
        return Monocle.get(lens, a).flatMap(forwardTransform(reversibleValueTransformer))
    }
    
    func set(a: R, c: V.ForwardTransformResult) -> R {
        return Monocle.set(lens, a, c.flatMap(reverseTransform(reversibleValueTransformer)))
    }

    return Lens(get: get, set: set)
}

// MARK: - Map (specialized)

public func map<A, V: ReversibleValueTransformerType>(lens: Lens<A, V.ReverseTransformResult.Value>, reversibleValueTransformer: V) -> Lens<AnyResult<A>, V.ForwardTransformResult> {
    return map(lift(lens), reversibleValueTransformer)
}

public func map<A: AnyObject, V: ReversibleValueTransformerType>(lens: Lens<A, V.ReverseTransformResult.Value>, reversibleValueTransformer: V) -> Lens<ObjectResult<A>, V.ForwardTransformResult> {
    return map(lift(lens), reversibleValueTransformer)
}

public func map<A, V: ReversibleValueTransformerType>(lens: Lens<AnyResult<A>, V.ReverseTransformResult>, reversibleValueTransformer: V) -> Lens<AnyResult<A>, V.ForwardTransformResult> {
    func get(a: AnyResult<A>) -> V.ForwardTransformResult {
        return Monocle.get(lens, a).flatMap(forwardTransform(reversibleValueTransformer))
    }
    
    func set(a: AnyResult<A>, c: V.ForwardTransformResult) -> AnyResult<A> {
        return Monocle.set(lens, a, c.flatMap(reverseTransform(reversibleValueTransformer)))
    }
    
    return Lens(get: get, set: set)
}

public func map<A: AnyObject, V: ReversibleValueTransformerType>(lens: Lens<ObjectResult<A>, V.ReverseTransformResult>, reversibleValueTransformer: V) -> Lens<ObjectResult<A>, V.ForwardTransformResult> {
    func get(a: ObjectResult<A>) -> V.ForwardTransformResult {
        return Monocle.get(lens, a).flatMap(forwardTransform(reversibleValueTransformer))
    }
    
    func set(a: ObjectResult<A>, c: V.ForwardTransformResult) -> ObjectResult<A> {
        return Monocle.set(lens, a, c.flatMap(reverseTransform(reversibleValueTransformer)))
    }
    
    return Lens(get: get, set: set)
}
