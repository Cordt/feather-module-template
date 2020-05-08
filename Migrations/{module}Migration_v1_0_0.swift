//
//  {module}Migration_v1_0_0.swift
//  {project}
//
//  Created by {author} on {date}.
//

import Vapor
import Fluent

struct {module}Migration_v1_0_0: Migration {

    func prepare(on db: Database) -> EventLoopFuture<Void> {
        db.eventLoop.flatten([
            db.schema({module}Model.schema)
                .id()
                .field({module}Model.FieldKeys.example, .string, .required)
                .unique(on: {module}Model.FieldKeys.example)
                .create(),
        ])
    }

    func revert(on db: Database) -> EventLoopFuture<Void> {
        db.eventLoop.flatten([
            db.schema({module}Model.schema).delete(),
        ])
    }
}
