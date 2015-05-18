//  Copyright (c) 2015 Felix Jendrusch. All rights reserved.

import Lustre
import ValueTransformer
import Monocle

public struct DictionaryAdapter<Key: Hashable, ForwardResult: ResultType, ReverseResult: ResultType>: AdapterType {
    public typealias ForwardInput = ReverseResult.Value
    public typealias ReverseInput = ForwardResult.Value

    public typealias Specification = [Key: Lens<ReverseResult, ForwardResult>]
    public typealias Dictionary = [Key: ReverseInput]
    public typealias DictionaryTransformer = ReversibleValueTransformer<ForwardResult, AnyResult<Dictionary>>
    public typealias ValueClosure = ReverseInput -> ReverseResult
    
    private let specification: Specification
    private let dictionaryTransformer: DictionaryTransformer
    private let valueClosure: ValueClosure

    public func forwardTransform(value: ForwardInput) -> ForwardResult {
        var initialDict = Dictionary(minimumCapacity: count(specification))
        return reduce(specification, success(initialDict)) { (result, element) in
            result.flatMap { (var dictionary) in
                get(element.1, success(value)).map {
                    dictionary[element.0] = $0
                    return dictionary
                }
            }
        }.flatMap {
            dictionaryTransformer.forwardTransform($0)
        }
    }
    
    public func reverseTransform(transformedValue: ReverseInput) -> ReverseResult {
        return dictionaryTransformer.reverseTransform(transformedValue).flatMap { dictionary in
            reduce(specification, valueClosure(transformedValue)) { (result, element) in
                map(dictionary[element.0]) {
                    set(element.1, result, success($0))
                } ?? result
            }
        }
    }
}

extension DictionaryAdapter {
    
    public init(specification: Specification, dictionaryTransformer: DictionaryTransformer, @autoclosure(escaping) value: () -> ForwardInput) {
        self.init(specification: specification, dictionaryTransformer: dictionaryTransformer, valueClosure: { _ in
            success(value())
        })
    }
    
}
