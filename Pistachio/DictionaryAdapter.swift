//  Copyright (c) 2015 Felix Jendrusch. All rights reserved.

import ValueTransformer
import Monocle

public struct DictionaryAdapter<Key: Hashable, Value, TransformedValue>: AdapterType {
    public typealias Specification = [Key: Lens<Value, TransformedValue>]
    private let specification: Specification

    public typealias DictionaryTransformer = ReversibleValueTransformer<[Key: TransformedValue], TransformedValue>
    private let dictionaryTransformer: DictionaryTransformer

    public typealias ValueClosure = TransformedValue throws -> Value
    private let valueClosure: ValueClosure

    public init(specification: Specification, dictionaryTransformer: DictionaryTransformer, valueClosure: ValueClosure) {
        self.specification = specification
        self.dictionaryTransformer = dictionaryTransformer
        self.valueClosure = valueClosure
    }

    public init(specification: Specification, dictionaryTransformer: DictionaryTransformer, @autoclosure(escaping) value: () throws -> Value) {
        self.init(specification: specification, dictionaryTransformer: dictionaryTransformer, valueClosure: { _ in
            try value()
        })
    }

    public func transform(value: Value) throws -> TransformedValue {
        var dictionary = [Key : TransformedValue]()
        for (key, lens) in specification {
            dictionary[key] = try lens.get(from: value)
        }
        return try dictionaryTransformer.transform(dictionary)
    }

    public func reverseTransform(transformedValue: TransformedValue) throws -> Value {
        let dictionary = try dictionaryTransformer.reverseTransform(transformedValue)
        return try specification.reduce(valueClosure(transformedValue)) { (result, element) in
            try dictionary[element.0].map { value in
                try element.1.set(value, within: result)
            } ?? result
        }
    }
}
