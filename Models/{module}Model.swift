//
//  {module}Model.swift
//  {project}
//
//  Created by {author} on {date}.
//

import Vapor
import Fluent

final class {module}Model: Model {

    static let schema = "example"

    struct FieldKeys {
        static var example: FieldKey { "example" }
    }

    // MARK: - fields

    @ID() var id: UUID?
    @Field(key: FieldKeys.example) var example: String

    init() { }

    init(id: {module}Model.IDValue? = nil,
         example: String)
    {
        self.id = id
        self.example = example
    }
}
