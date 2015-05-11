//  Copyright (c) 2015 Felix Jendrusch. All rights reserved.

import Lustre
import ValueTransformer
import Monocle

public struct DictionaryAdapter<Key: Hashable, Result: ResultType, TransformResult: ResultType>: AdapterType {
    public typealias Value = Result.Value
    public typealias TransformedValue = TransformResult.Value

    public typealias Specification = [Key: Lens<Result, TransformResult>]
    private let specification: Specification

    public typealias DictionaryTransformer = ReversibleValueTransformer<[Key: TransformResult.Value], TransformResult, AnyResult<[Key: TransformResult.Value]>>
    private let dictionaryTransformer: DictionaryTransformer

    public typealias ValueClosure = TransformResult.Value -> Result
    private let valueClosure: ValueClosure

    public init(specification: Specification, dictionaryTransformer: DictionaryTransformer, valueClosure: ValueClosure) {
        self.specification = specification
        self.dictionaryTransformer = dictionaryTransformer
        self.valueClosure = valueClosure
    }

    public init(specification: Specification, dictionaryTransformer: DictionaryTransformer, @autoclosure(escaping) value: () -> Value) {
        self.init(specification: specification, dictionaryTransformer: dictionaryTransformer, valueClosure: { _ in
            success(value())
        })
    }

    public func transform(value: Value) -> TransformResult {
        return reduce(specification, success([:])) { (result, element) in
            let (key, lens) = element
            return result.flatMap { (var dictionary) in
                get(lens, success(value)).map { value in
                    dictionary[key] = value
                    return dictionary
                }
            }
        }.flatMap {
            dictionaryTransformer.transform($0)
        }
    }
    
    public func reverseTransform(transformedValue: TransformedValue) -> Result {
        return dictionaryTransformer.reverseTransform(transformedValue).flatMap { dictionary in
            return reduce(specification, valueClosure(transformedValue)) { (result, element) in
                let (key, lens) = element
                return map(dictionary[key]) { value in
                    set(lens, result, success(value))
                } ?? result
            }
        }
    }
}
