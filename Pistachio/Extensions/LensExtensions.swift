//  Copyright (c) 2015 Felix Jendrusch. All rights reserved.

import ValueTransformer
import Monocle

// MARK: - Map

extension LensType {

    public func map<Transformer: ReversibleValueTransformerType where Transformer.OriginalValue == Part>(transformer: Transformer) -> Lens<Whole, Transformer.TransformedValue> {
        return .init(get: { whole in
            try transformer.transform(self.get(from: whole))
        }, set: { (inout whole: Whole, part) in
            try self.set(try transformer.reverseTransform(part), within: &whole)
        })
    }
    
}
