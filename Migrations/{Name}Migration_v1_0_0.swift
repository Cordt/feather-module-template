//
//  {Name}Migration_v1_0_0.swift
//  {project}
//
//  Created by {author} on {date}.
//

import FeatherCore

struct {Name}Migration_v1_0_0: Migration {

    func prepare(on db: Database) -> EventLoopFuture<Void> {
        db.schema({Name}Model.schema)
            .id()
            .field({Name}Model.FieldKeys.title, .string, .required)
            .create()

    }

    func revert(on db: Database) -> EventLoopFuture<Void> {
        db.schema({Name}Model.schema).delete()
    }
}
