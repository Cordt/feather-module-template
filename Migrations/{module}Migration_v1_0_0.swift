//
//  {module}Migration_v1_0_0.swift
//  {project}
//
//  Created by {author} on {date}.
//

import FeatherCore
import Fluent

struct {module}Migration_v1_0_0: Migration {

    func prepare(on db: Database) -> EventLoopFuture<Void> {
        db.schema({module}Model.schema)
            .id()
            .field({module}Model.FieldKeys.title, .string, .required)
            .create()
        
    }

    func revert(on db: Database) -> EventLoopFuture<Void> {
        db.schema({module}Model.schema).delete()
    }
}
