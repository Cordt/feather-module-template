//
//  {module}Model.swift
//  {project}
//
//  Created by {author} on {date}.
//

import FeatherCore

final class {module}Model: ViperModel {
    typealias Module = {module}Module

    static let name = "examples"

    struct FieldKeys {
        static var title: FieldKey { "title" }
    }

    // MARK: - fields

    @ID() var id: UUID?
    @Field(key: FieldKeys.title) var title: String

    init() { }

    init(id: UUID? = nil,
        title: String
    ) {
        self.id = id
        self.title = title
    }
}
