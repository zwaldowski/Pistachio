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

public func map<R: ResultType, V: ReversibleValueTransformerType where V.Value == V.ReverseTransformResult.Value>(lens: Lens<R.Value, V.Value>, reversibleValueTransformer: V) -> Lens<R, V.TransformResult> {
    return map(lift(lens), reversibleValueTransformer)
}

public func map<R: ResultType, V: ReversibleValueTransformerType where V.Value == V.ReverseTransformResult.Value>(lens: Lens<R, V.ReverseTransformResult>, reversibleValueTransformer: V) -> Lens<R, V.TransformResult> {
    func get(a: R) -> V.TransformResult {
        return Monocle.get(lens, a).flatMap(transform(reversibleValueTransformer))
    }
    
    func set(a: R, c: V.TransformResult) -> R {
        return Monocle.set(lens, a, c.flatMap(reverseTransform(reversibleValueTransformer)))
    }

    return Lens(get: get, set: set)
}

// MARK: - Map (specialized)

public func map<A, V: ReversibleValueTransformerType where V.Value == V.ReverseTransformResult.Value>(lens: Lens<A, V.Value>, reversibleValueTransformer: V) -> Lens<AnyResult<A>, V.TransformResult> {
    return map(lift(lens), reversibleValueTransformer)
}

public func map<A: AnyObject, V: ReversibleValueTransformerType where V.Value == V.ReverseTransformResult.Value>(lens: Lens<A, V.Value>, reversibleValueTransformer: V) -> Lens<ObjectResult<A>, V.TransformResult> {
    return map(lift(lens), reversibleValueTransformer)
}

public func map<A, V: ReversibleValueTransformerType where V.Value == V.ReverseTransformResult.Value>(lens: Lens<AnyResult<A>, V.ReverseTransformResult>, reversibleValueTransformer: V) -> Lens<AnyResult<A>, V.TransformResult> {
    func get(a: AnyResult<A>) -> V.TransformResult {
        return Monocle.get(lens, a).flatMap(transform(reversibleValueTransformer))
    }
    
    func set(a: AnyResult<A>, c: V.TransformResult) -> AnyResult<A> {
        return Monocle.set(lens, a, c.flatMap(reverseTransform(reversibleValueTransformer)))
    }
    
    return Lens(get: get, set: set)
}

public func map<A: AnyObject, V: ReversibleValueTransformerType where V.Value == V.ReverseTransformResult.Value>(lens: Lens<ObjectResult<A>, V.ReverseTransformResult>, reversibleValueTransformer: V) -> Lens<ObjectResult<A>, V.TransformResult> {
    func get(a: ObjectResult<A>) -> V.TransformResult {
        return Monocle.get(lens, a).flatMap(transform(reversibleValueTransformer))
    }
    
    func set(a: ObjectResult<A>, c: V.TransformResult) -> ObjectResult<A> {
        return Monocle.set(lens, a, c.flatMap(reverseTransform(reversibleValueTransformer)))
    }
    
    return Lens(get: get, set: set)
}