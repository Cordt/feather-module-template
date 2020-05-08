//
//  {module}Model.swift
//  {project}
//
//  Created by {author} on {date}.
//

import Vapor
import Fluent
import ViperKit

final class {module}Model: ViperModel {
    typealias Module = {module}Module

    static let name = "examples"

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
